<?php

class PostController extends BaseController {

	protected $post;

	/**
	 * @param Post $post
	 */
	public function __construct(Post $post) {
		$this->post = $post;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index() {
		if (Entrust::hasRole('Response'))
			$post = $this->post->shown()->orderBy('created_at', 'asc');
		else
			$post = $this->post->everything_else()->orderBy('created_at', 'asc');

		$post = $post->paginate(10);

		if ($post->count() != 0) {
//			if(isset($paginate['page'])) {
//				if ($paginate['page'] > 1) {
//					Cache::forget('posts');
//				}
//			}

			//			$cached = Cache::remember('posts', 1, function() use ($post) {
			return Response::json([
					'status' => 'POST_SHOW_SUCCESSFUL',
					'posts'  => $post->toArray()
			], 200);
//			});

//			return $cached;
		}

		// F@iLZOR$$$$
		return Response::json([
			'status'      => 'POST_SHOW_FAILED',
			'description' => 'Returned empty result'
		], 200);
	}

	/**
	 * GET: Display the specified resource.
	 *
	 * @param  Post $post
	 *
	 * @return Response
	 */
	public function show(Post $post) {
		if ($post->count() == 0 or !($post->isShown())) {
			return Response::json([
				'status'      => 'POST_SHOW_FAILED',
				'description' => "Post not found."
			], 200);
		}

		return Response::json([
			'status' => 'POST_SHOW_SUCCESSFUL',
			'posts'  => $post->toArray()
		], 200);
	}

	/**
	 * GET: Show unnapproved posts. For Mod use only
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function show_unapproved() {
		$post = $this->post->not_shown()->paginate(10);

		if ($post->count() != 0) {
			return Response::json([
				'status' => 'POST_SHOW_UNAPPROVED_SUCCESSFUL',
				'posts'  => $post->toArray()
			], 200);
		}

		return Response::json([
			'status'      => 'POST_SHOW_UNAPPROVED_FAILED',
			'description' => 'Returned empty result'
		], 200);
	}

	/**
	 * POST: Store a newly created resource in storage.
	 *
	 * @param Post $post
	 *
	 * @return Response
	 */
	public function create_edit(Post $post = null) {
		if (is_null($post)) {
			$post   = $this->post;
			$status = 'POST_ADD';
			$isNewPost = true;

			$rules = [
				'title'       => ['required', 'regex:([[:print:][:alnum:]]+)'],
				'content'     => ['required', 'regex:([[:print:][:alnum:]]+)'] //,'geolocation' => ['regex:[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)']
			];
		} elseif ($post->isTheAuthor() or Entrust::hasRole('Moderator')) {
			$status = 'POST_UPDATE';
			$isNewPost = false;

			$rules = [
				'title'       => ['regex:([[:print:][:alnum:]]+)'],
				'content'     => ['regex:([[:print:][:alnum:]]+)'] //, 'geolocation' => ['regex:[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)']
			];
		} else {
			return Response::json([
				'status'      => 'POST_UPDATE_FAILED',
				'description' => 'You are forbidden to modify this resource'
			], 403);
		}

		$input = Input::all();

		$validator = Validator::make($input, $rules);

		if($validator->passes()) {
			$category = Category::where('name', '=', $input['category'])->firstOrFail();

			$tags = Tag::whereIn('tagname', $input['tags'])->lists('id');

			$post->title       = $input['title'];
			$post->content     = $input['content'];
			$post->geolocation = $input['geolocation'];

			if ($isNewPost)
				$post->user_id = Confide::user()->getAuthIdentifier();

			$post->category()->associate($category);

			if ($post->save()) {
				$post->tags()->sync($tags);

				if ($isNewPost) {
					$post->properties()->save(new Property([
						'is_shown'    => 0, //1, // DO THIS. Set to 0 to not show new posts without approval of mod.
						'is_featured' => 0
					]));
				}

				return Response::json([
					'status' => $status . '_SUCCESSFUL',
					'posts'  => $post->toArray()
				], 201);
			}

			return Response::json([
				'status' => $status . '_FAILED',
				'posts'  => $post->toArray()
			], 500);
		} else {
			$messages = $validator->messages();

			return Response::json([
				'status'      => $status . '_FAILED',
				'description' => $messages->toArray()
			], 200);
		}
	}

	/**
	 * POST: Remove the specified resource from storage.
	 *
	 * @param  Post $post
	 *
	 * @return Response
	 */
	public function destroy(Post $post) {
		if ($post->isTheAuthor() or Entrust::hasRole('Moderator')) {
			Comment::where('post_id', '=', $post->id)->delete();
			Like::where('likeable_id', '=', $post->id)->where('likeable_type', '=', 'Post')->delete();
			Property::where('properties_id', '=', $post->id)->where('properties_type', '=', 'Post')->delete();

			if ($post->delete()) {
				return Response::json([
					'status'      => 'POST_DELETE_SUCCESSFUL',
					'description' => 'Post deleted, along with comments, properties, and likes'
				], 200);
			}

			return Response::json([
				'status'      => 'POST_DELETE_FAILED',
				'description' => "Post {$post->id} deletion failed."
			], 500);
		}

		return Response::json([
			'status'      => 'POST_DELETE_FAILED',
			'description' => 'You are forbidden to delete this resource'
		], 403);
	}

	/**
	 * GET: Show all comments [or comment if $comment not null] for post
	 *
	 * @param  Post    $post
	 * @param  Comment $comment_id = null
	 *
	 * @return Response
	 */
	public function comments(Post $post, $comment_id = null) {
		if (is_null($comment_id)) {
			$comments = $post->comments()->orderBy('created_at', 'asc')->paginate(10);

			return Response::json([
				'status'  => 'POST_COMMENT_RETRIEVE_SUCCESSFUL',
				'comment' => $comments->toArray()
			], 200);
		}

		$comments = Comment::where('post_id', '=', $post->id)->where('id', '=', $comment_id)->orderBy('created_at', 'asc')->get();

		if($comments->count() != 0) {
			return Response::json([
				'status'  => 'POST_COMMENT_RETRIEVE_SUCCESSFUL',
				'comment' => $comments->toArray()
			], 200);
		}

		return Response::json([
			'status'  => 'POST_COMMENT_RETRIEVE_FAILED',
			'description' => 'Comment id # ' . $comment_id . ' not member of Post id # ' . $post->id
		], 200);
	}

	/**
	 * GET: Show all tags for post
	 *
	 * @param Post $post
	 *
	 * @return Response
	 */
	public function tags(Post $post) {
		$tags = $post->tags;

		if ($tags->count() == 0) {
			return Response::json([
				'status'      => 'POST_TAGS_RETRIEVE_FAILED',
				'description' => "Tags for Post {$post->id} not found."
			], 200);
		}

		$tags_a = [
			'count'  => $tags->count(),
			'result' => $tags->toArray()
		];

		return Response::json([
			'status' => 'POST_TAGS_RETRIEVE_SUCCESSFUL',
			'tags'   => $tags_a
		], 200);
	}

	/**
	 * GET: Show all likes for post/comment
	 *
	 * @param Post    $post
	 * @param Comment $comment
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function likes(Post $post, Comment $comment = null) {
		$item = is_null($comment) ? $post : $comment;

		$likes = $item->likes()->lists('user_id');

		$type = get_class($item);

		return Response::json([
			'status' => strtoupper($type) . '_LIKES_RETRIEVE_SUCCESSFUL',
			'likes'  => $likes
		], 200);
	}

	/**
	 * POST: Like/unlike Post/Comment
	 *
	 * @param Post $post
	 * @param Comment $comment
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function like(Post $post, Comment $comment = null) {
		$item = is_null($comment) ? $post : $comment;

		$user_id = Confide::user()->getAuthIdentifier();
		$item_id = $item->id;

		$type = get_class($item);

		$like = Like::where('user_id', '=', $user_id)->where('likeable_id', '=', $item_id)->where('likeable_type', '=', $type)->first();

		if (!is_null($like)) {
			$like->delete();
		} else {
			$item->likes()->save(new Like([
				'user_id' => $user_id
			]));
		}

		$likes = $item::find($item->id)->likes()->lists('user_id');

		return Response::json([
			'status' => strtoupper($type) . '_CREATE_LIKE_SUCCESS',
			'likes'  => $likes
		], 200);
	}

	/**
	 * POST: Create or Update Comment for Post
	 *
	 * @param Post    $post
	 * @param Comment $comment
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function create_update_comment(Post $post, Comment $comment = null) {
		if (is_null($comment)) {
			$comment = new Comment;
			$status  = 'POST_COMMENT_CREATE';
			$isNewComment = true;

			$rules = [
				'message' => ['required', 'regex:([[:print:][:alnum:]]+)']
			];
		} elseif ($comment->isTheAuthor() or Entrust::hasRole('Moderator')) {
			$status = 'POST_COMMENT_EDIT';
			$isNewComment = false;

			$rules = [
				'message' => ['regex:([[:print:][:alnum:]]+)']
			];
		} else {
			return Response::json([
				'status'      => 'POST_COMMENT_EDIT_FAILED',
				'description' => 'You are forbidden to edit this resource'
			], 403);
		}

		$message = Input::all();

		$validator = Validator::make($message, $rules);

		if($validator->passes()) {
			if ($isNewComment)
				$comment->user_id = Confide::user()->getAuthIdentifier();

			$comment->message = $message['message'];

			if ($comment = $post->comments()->save($comment)) {
				if ($isNewComment) {
					$comment->properties()->save(new Property([
						'is_shown'    => 1,
						'is_featured' => 0
					]));
				}

				$comment = Comment::where('id', '=', $comment->id)->get();

				return Response::json([
					'status'  => $status . '_SUCCESS',
					'comment' => $comment->toArray()
				], 200);
			} else {
				return Response::json([
					'status'      => $status . '_FAILED',
					'description' => 'Comment edit failed.'
				], 200);
			}
		} else {
			$messages = $validator->messages();

			return Response::json([
				'status'      => $status . '_FAILED',
				'description' => $messages->toArray()
			], 200);
		}
	}

	/**
	 * POST: Delete comment from post
	 *
	 * @param Post    $post
	 * @param Comment $comment
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function delete_comment(Post $post, Comment $comment = null) {
		if (is_null($comment)) {
			if($post->isTheAuthor() or Entrust::hasRole('Moderator')) {
				$comments_a = array_flatten($post->comments()->get(['id'])->toArray());

				Like::where('likeable_type', '=', 'comment')->whereIn('likeable_id', $comments_a)->delete();
				Property::where('properties_type', '=', 'comment')->whereIn('properties_id', $comments_a)->delete();

				$post->comments()->delete();

				return Response::json([
					'status' => 'POST_COMMENT_DELETE_SUCCESSFUL'
				], 200);
			} else {
				return Response::json([
					'status'      => 'POST_COMMENT_DELETE_FAILED',
					'description' => 'You are forbidden to delete this resource'
				], 403);
			}
		}

		if($comment->isTheAuthor() or Entrust::hasRole('Moderator')) {
			Like::where('likeable_id', '=', $comment->id)->where('likeable_type', '=', 'Comment')->delete();
			Property::where('properties_id', '=', $comment->id)->where('properties_type', '=', 'Comment')->delete();

			if ($comment->delete()) {
				return Response::json([
					'status' => 'POST_COMMENT_DELETE_SUCCESSFUL'
				], 200);
			}
		} else {
			return Response::json([
				'status'      => 'POST_COMMENT_DELETE_FAILED',
				'description' => 'You are forbidden to delete this resource'
			], 403);
		}

		return Response::json([
			'status'      => 'POST_COMMENT_DELETE_FAILED',
			'description' => 'Unknown error occured.'
		], 500);
	}

	/** // TODO: This thing searches ALL POSTS. Fix on notShown() in the case of non-Response role.
	 * POST: Search for things.
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function search() {
		$data = Input::all();

		$post = $this->post->where('id', '=', 'a');

		$rules = [
		    'query'     => [ 'required','regex:([[:print:][:alnum:]]+)' ],
		    'offset'    => 'integer',
		    'limit'     => 'integer'
		];

		$searchOnTitle = isset($data['title']);
		$searchOnContent = isset($data['content']);
		$searchOnAuthor = isset($data['author']);
		$searchTags = isset($data['tags']);
		$searchCategory = isset($data['category']);
		$searchAll = isset($data['all']);
		$queryString = empty($data['query']) ? "" : $data['query'];

		$offset = isset($data['offset']) ? $data['offset'] : 0;
		$limit = isset($data['limit']) ? $data['limit'] : 10;

		$validator = Validator::make($data, $rules);

		if ($validator->passes()) {
			if (!$searchAll) {
				if($searchOnTitle) {
					$queryTitle = Post::where('title', 'like', '%' .$queryString.'%')->getQuery();
					$post = $post->union($queryTitle);
				}

				if($searchOnContent) {
					$queryContent = Post::where('content', 'like', '%'.$queryString.'%')->getQuery();
					$post = $post->union($queryContent);
				}

				if($searchOnAuthor) {
					$queryAuthor = Post::whereHas('author', function($q) use ($queryString) {
						$q->where('username', 'like', '%'.$queryString.'%');
					})->getQuery();

					$post = $post->union($queryAuthor);
				}

				if($searchTags) {
					$queryTags = Post::whereHas('tags', function ($q) use ($queryString) {
						$q->where('tagname', 'like', '%' . $queryString . '%');
					})->getQuery();

					$post = $post->union($queryTags);
				}
				if($searchCategory) {
					$queryCategory = Post::whereHas('category', function($q) use ($queryString) {
						$q->where('name', 'like', '%' . $queryString . '%');
					})->getQuery();

					$post = $post->union($queryCategory);
				}
			} else {
				$queryTitle = Post::where('title', 'like', '%' . $queryString . '%')->getQuery();

				$queryContent = Post::where('content', 'like', '%' . $queryString . '%')->getQuery();

				$queryAuthor = Post::whereHas('author', function ($q) use ($queryString) {
					$q->where('username', 'like', '%' . $queryString . '%');
				})->getQuery();

				$queryTags = Post::whereHas('tags', function ($q) use ($queryString) {
					$q->where('tagname', 'like', '%' . $queryString . '%');
				})->getQuery();

				$queryCategory = Post::whereHas('category', function ($q) use ($queryString) {
					$q->where('name', 'like', '%' . $queryString . '%');
				})->getQuery();

				$post = $post->union($queryTitle)
							 ->union($queryContent)
							 ->union($queryAuthor)
					         ->union($queryTags)
					         ->union($queryCategory);
			}

			$postCollection = $post->skip($offset)->take($limit)->get(); // TODO: this fails miserably, i mean the offset and limit

			if($postCollection->count() != 0) {
				return Response::json([
					'status' => 'POST_SEARCH_SUCCESSFUL',
					'posts'  => $postCollection->toArray()
				], 200);
			}

			return Response::json([
				'status'      => 'POST_SEARCH_FAILED',
				'description' => 'No posts containing the string "' . $queryString . '" found. Sorry :P'
			], 200);
		}

		$messages = $validator->messages();

		return Response::json([
			'status'      => 'POST_SEARCH_FAILED',
		    'description' => $messages->toArray()
		], 200);
	}
}
