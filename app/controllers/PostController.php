<?php

class PostController extends BaseController {

	protected $post;

	public function __construct(Post $post) {
		$this->post = $post;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index() {
		$post = $this->post->all();

		$data = Input::all();

		$rules = [
			'category' => 'alpha_num',
			'tagname'  => 'alpha_num'
		];

		$isValid = Validator::make($data, $rules)->passes();

		if ($isValid) {
			$category = Input::get('category');
			$tagname  = Input::get('tagname');

			// get all posts
			if (is_null($category) && is_null($tagname)) {
				if ($post->count() != 0) {
					return Response::json([
							'status' => 'POST_SHOW_SUCCESSFUL',
							'posts'  => $post->toArray()
						], 200, [ 'Content-Type' => 'application/javascript' ]
					);
				}
				// get posts where category={a-z}
			} elseif (is_null($tagname)) {
				$post = $this->post->whereHas('Category', function ($q) use ($category) {
					$q->where('name', '=', $category);
				})->get();

				if ($post->count() != 0) {
					return Response::json([
							'status' => 'POST_SHOW_SUCCESSFUL',
							'posts'  => $post->toArray()
						], 200, [ 'Content-Type' => 'application/javascript' ]
					);
				}

				return Response::json(array(
						'status'      => 'POST_SHOW_FAILED',
						'description' => 'No posts for query.',
						'input'       => 'category?=' . $category
					), 404, [ 'Content-Type' => 'application/javascript' ]
				);
				// get posts where tags={a-z}
			} elseif (is_null($category)) { // TODO: Tag find not working
				$post = $this->post->whereHas('Tag', function ($q) use ($tagname) {
					$q->where('tagname', '=', $tagname);
				})->get();

				if ($post->count() != 0) {
					return Response::json([
							'status' => 'POST_SHOW_SUCCESSFUL',
							'posts'  => $post->toArray()
						], 200, [ 'Content-Type' => 'application/javascript' ]
					);
				}

				return Response::json([
						'status'      => 'POST_SHOW_FAILED',
						'description' => 'No posts for query.',
						'input'       => 'tagname?=' . $tagname
					], 404, [ 'Content-Type' => 'application/javascript' ]
				);
			}
		}

		// F@iLZOR$$$$
		return Response::json([
				'status'      => 'POST_SHOW_FAILED',
				'description' => 'Returned empty result'
			], 404, [ 'Content-Type' => 'application/javascript' ]
		);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store() {
		$post = $this->post;

		$input = Input::all();

		$category = Category::where('name', '=', $input['category'])->firstOrFail();

		$post->title   = $input['title'];
		$post->content = $input['content'];
		$post->user_id = Confide::user()->getAuthIdentifier();
		$post->category()->associate($category);

		$post->save();

		return Response::json(array(
				'status' => 'POST_ADD_SUCCESSFUL',
				'posts'  => $post->toArray()
			), 200, [ 'Content-Type' => 'application/javascript' ]
		);
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  Post $id
	 * @return Response
	 */
	public function show(Post $id) {
		if (is_null($id)) {
			return Response::json(array(
					'status'      => 'POST_SHOW_FAILED',
					'description' => "Post {$id} not found."
				), 404, [ 'Content-Type' => 'application/javascript' ]
			);
		}

		return Response::json(array(
				'status' => 'POST_SHOW_SUCCESSFUL',
				'posts'  => $id->toArray()
			), 200
		);
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  Post $id
	 * @return Response
	 */
	public function update(Post $id) {
		$post = $id;

		$input = Input::all();

		$category = Category::where('name', '=', $input['category'])->firstOrFail();



		$post->title   = $input['title'];
		$post->content = $input['content'];
		$post->user_id = Confide::user()->getAuthIdentifier();
		$post->category()->associate($category);

		$post->save();

		return Response::json(array(
				'status' => 'POST_UPDATE_SUCCESSFUL',
				'posts'  => $post->toArray()
			), 201
		);
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int $id
	 * @return Response
	 */
	public function destroy(Post $id) {
		$post = $id;

		foreach ($id->comments as $comments) {
			$comments->delete();
		}

		if($id->delete()) {
			return Response::json(array(
					'status' => 'POST_DELETE_SUCCESSFUL',
					'posts'  => $post->toArray()
				), 204
			);
		}

		return Response::json([
			'status'      => 'POST_DELETE_FAILED',
			'description' => "Post {$id->id} deletion failed."
		], 200);
	}

	public function comments(Post $id) {
		$comments = $id->comments;

		if (is_null($comments)) {
			return Response::json(array(
					'status'      => 'POST_COMMENT_RETRIEVE_FAILED',
					'description' => "Comments for Post {$id->id} not found."
				), 404
			);
		}

		return Response::json(array(
				'status'   => 'POST_COMMENT_RETRIEVE_SUCCESSFUL',
				'comments' => $comments->toArray()
			), 200
		);
	}

	public function tags(Post $id) {
		$tags = $id->tags;

		if (is_null($tags)) {
			return Response::json(array(
					'status'      => 'POST_COMMENT_RETRIEVE_FAILED',
					'description' => "Tags for Post {$id->id} not found."
				), 404
			);
		}

		return Response::json(array(
				'status' => 'POST_TAG_RETRIEVE_SUCCESSFUL',
				'tags'   => $tags->toArray()
			), 200
		);
	}

	public function like() {

	}

}