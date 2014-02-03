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
			'category' => 'alpha_num'
		];

		$isValid = Validator::make($data, $rules)->passes();

		if ($isValid) {
			$category = Input::get('category');

			if (is_null($category)) {
				return Response::json(array(
						'status' => 'POST_SHOW_SUCCESSFUL',
						'posts'  => $post->toArray()
					), 200
				);
			} else {    // TODO : filter by ?category={a-z0-9}
				$post = $this->post->whereHas('Category', function($q) use ($category) {
					$q->where('name', '=', $category);
				})->get();

				return $post;
			}
		}

		return Response::json(array(
				'status'      => 'POST_SHOW_FAILED',
				'description' => "Returned empty result"
			), 404
		);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create() {

	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store() {
		$post = $this->post;

		$post->title   = Request::get('title');
		$post->content = Request::get('content');
		$post->type    = Request::get('type');
		$post->user_id = Auth::user()->getAuthIdentifier();

		$post->save();

		return Response::json(array(
				'status' => 'POST_ADD_SUCCESSFUL',
				'posts'  => $post->toArray()
			), 200
		);
	}

	public function storeShoutout() {
		$post = $this->post;

		$post->title   = Request::get('title');
		$post->content = Request::get('content');
		$post->type    = Request::get('type');
		$post->user_id = Auth::user()->getAuthIdentifier();

		$post->save();

		return Response::json(array(
				'status' => 'POST_ADD_SUCCESSFUL',
				'posts'  => $post->toArray()
			), 200
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
				), 404
			);
		}

		return Response::json(array(
				'status' => 'POST_SHOW_SUCCESSFUL',
				'posts'  => $id->toArray()
			), 200
		);
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int $id
	 * @return Response
	 */
	public function edit($id) {
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int $id
	 * @return Response
	 */
	public function update($id) {
		$post = $this->post->where('user_id', Auth::user()->getAuthIdentifier())->findOrFail($id);

		$post->title   = Request::get('title');
		$post->content = Request::get('content');
		$post->type    = Request::get('type');

		$post->save();

		return Response::json(array(
				'status' => 'POST_UPDATE_SUCCESSFUL',
				'posts'  => $post->toArray()
			), 200
		);
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int $id
	 * @return Response
	 */
	public function destroy(Post $id) {
		//$post = $this->post->where('user_id', Auth::user()->getAuthIdentifier())->findOrFail($id);

		if (Auth::check()) {
			$post = $id;

			$id->delete();

			return Response::json(array(
					'status' => 'POST_DELETE_SUCCESSFUL',
					'posts'  => $post->toArray()
				), 200
			);
		}

		return Redirect::to('/');
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
				, 200
			)
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