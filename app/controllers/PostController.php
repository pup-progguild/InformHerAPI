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
			$post = $this->post->shown();
		else
			$post = $this->post->everything_else();

		$data = Input::all();

		$rules = [
			'category' => 'alpha_num' // , 'tagname'  => 'alpha_num'
		];

		$isValid = Validator::make($data, $rules)->passes();

		if ($isValid) {
			$category = Input::get('category');
			$tagname  = Input::get('tagname');


			if (is_null($category) && is_null($tagname)) {
				$post_count = $post->count();

				$post = $post->get();

				$posts_a = [
					'count'  => $post_count,
					'result' => $post->toArray()
				];

				if ($post_count != 0) {
					return Response::json([
						'status' => 'POST_SHOW_SUCCESSFUL',
						'posts'  => $posts_a
					], 200);
				}
				// get posts where category={a-z}
			} elseif (is_null($tagname)) {
				$post = $post->whereHas('Category', function ($q) use ($category) {
					$q->where('name', '=', $category);
				})->get();


				$post_count = $post->count();

				if ($post_count != 0) {
					$posts_a = [
						'count'  => $post_count,
						'result' => $post->toArray()
					];

					return Response::json([
						'status' => 'POST_SHOW_SUCCESSFUL',
						'posts'  => $posts_a
					], 200);
				}

				return Response::json([
					'status'      => 'POST_SHOW_FAILED',
					'description' => 'No posts for query.',
					'input'       => 'category?=' . $category
				], 200);
				// get posts where tags={a-z} // TODO: Tag find not working
			} /*elseif (is_null($category)) {
				$post = $post->whereHas('Tag', function ($q) use ($tagname) {
					$q->where('tagname', '=', $tagname);
				})->get();

				$post_count = $post->count();

				if ($post_count != 0) {
					$posts_a = [
						'count'     => $post_count,
					    'result'    => $post->toArray()
					];

					return Response::json([
						'status' => 'POST_SHOW_SUCCESSFUL',
						'posts'  => $posts_a
					], 200);
				}

				return Response::json([
					'status'      => 'POST_SHOW_FAILED',
					'description' => 'No posts for query.',
					'input'       => 'tagname?=' . $tagname
				], 404);
			}*/
		}

		// F@iLZOR$$$$
		return Response::json([
			'status'      => 'POST_SHOW_FAILED',
			'description' => 'Returned empty result'
		], 200);
	}

	/**
	 * Display the specified resource.
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

	public function show_unapproved() {
		$post = $this->post->not_shown()->get();

		$post_count = $post->count();

		if ($post_count != 0) {
			$posts_a = [
				'count'  => $post_count,
				'result' => $post->toArray()
			];

			return Response::json([
				'status' => 'POST_SHOW_UNAPPROVED_SUCCESSFUL',
				'posts'  => $posts_a
			], 200);
		}

		return Response::json([
			'status'      => 'POST_SHOW_UNAPPROVED_FAILED',
			'description' => 'Returned empty result'
		], 200);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param Post $post
	 *
	 * @return Response
	 */
	public function create_edit(Post $post = null) {
		$isNewPost = false;

		if (is_null($post)) {
			$post   = $this->post;
			$status = 'POST_ADD';
			$isNewPost = true;

		} elseif ($post->isTheAuthor() or Entrust::hasRole('Moderator')) {
			$status = 'POST_UPDATE';
			$isNewPost = false;

		} else {
			return Response::json([
				'status'      => 'POST_UPDATE_FAILED',
				'description' => 'You are forbidden to modify this resource'
			], 403);
		}

		$input = Input::all();

		$category = Category::where('name', '=', $input['category'])->firstOrFail();

		$tags = Tag::whereIn('tagname', $input['tags'])->lists('id');

		$post->title   = $input['title'];
		$post->content = $input['content'];
		$post->user_id = Confide::user()->getAuthIdentifier();

		$post->category()->associate($category);

		if ($post->save()) {
			$post->tags()->sync($tags);

			if ($isNewPost) {
				$post->properties()->save(new Property([
					'is_shown'      =>  0,
					'is_featured'   =>  0
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
	}

	/**
	 * Remove the specified resource from storage.
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
	 * Show all comments [or comment if $comment not null] for post
	 *
	 * @param  Post    $post
	 * @param  Comment $comment_id = null
	 *
	 * @return Response
	 */
	public function comments(Post $post, $comment_id = null) {
		if (is_null($comment_id)) {
			$comments = $post->comments;

			$comments_a = [
				'count'  => $comments->count(),
				'result' => $comments->toArray()
			];

			return Response::json([
				'status'  => 'POST_COMMENT_RETRIEVE_SUCCESSFUL',
				'comment' => $comments_a
			], 200);
		}

		$comments = Comment::where('post_id', '=', $post->id)->where('id', '=', $comment_id)->get();

		$comments_a = [
			'count'  => $comments->count(),
			'result' => $comments->toArray()
		];

		return Response::json([
			'status'  => 'POST_COMMENT_RETRIEVE_SUCCESSFUL',
			'comment' => $comments_a
		], 200);
	}

	/**
	 * Show all tags for post
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
	 * Show all likes for post/comment
	 *
	 * @param Post    $post
	 * @param Comment $comment
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function likes(Post $post, Comment $comment = null) {
		$item = is_null($comment) ? $post : $comment;

		$likes = $item->likes;

		$type = get_class($item);

		$likes_a = [
			'count'  => $likes->count(),
			'result' => $likes->toArray()
		];

		return Response::json([
			'status' => strtoupper($type) . '_LIKES_RETRIEVE_SUCCESSFUL',
			'likes'  => $likes_a
		], 200);
	}

	/**
	 * Create or Update Comment for Post
	 *
	 * @param Post    $post
	 * @param Comment $comment
	 *
	 * @return \Illuminate\Http\JsonResponse
	 */
	public function create_update_comment(Post $post, Comment $comment = null) {
		$isNewComment = false;

		if (is_null($comment)) {
			$comment = new Comment;
			$status  = 'POST_COMMENT_CREATE';
			$isNewComment = true;

		} elseif ($comment->isTheAuthor() or Entrust::hasRole('Moderator')) {
			$status = 'POST_COMMENT_EDIT';
			$isNewComment = false;
		} else {
			return Response::json([
				'status'      => 'POST_COMMENT_EDIT_FAILED',
				'description' => 'You are forbidden to edit this resource'
			], 403);
		}

		$comment->user_id = Confide::user()->getAuthIdentifier();
		$comment->message = Input::get('message');

		if ($comment = $post->comments()->save($comment)) {
			if ($isNewComment) {
				$comment->properties()->save(new Property([
					'is_shown'    => 1,
					'is_featured' => 0
				]));
			}

			$comment = Comment::where('id', '=', $comment->id)->get();

			$comments_a = [
				'count'  => $comment->count(),
				'result' => $comment->toArray()
			];

			return Response::json([
				'status'  => $status . '_SUCCESS',
				'comment' => $comments_a
			], 200);
		} else {
			return Response::json([
				'status'      => $status . '_FAILED',
				'description' => 'Comment edit failed.'
			], 200);
		}
	}

	/**
	 * Delete comment from post
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

	/**
	 * Like/unlike Post/Comment
	 *
	 * @param Post    $post
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

		$likes = $item::find($item->id)->likes;

		$likes_a = [
			'count'  => $likes->count(),
			'result' => $likes->toArray()
		];

		return Response::json([
			'status' => strtoupper($type) . '_CREATE_LIKE_SUCCESS',
			'likes'  => $likes_a
		], 200);
	}
}
