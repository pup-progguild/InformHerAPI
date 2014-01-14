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
	public function index()
	{
		//
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create() {
        $post = $this->post;

        $post->title   = Input::get('title');
        $post->content = Input::get('content');
        $post->type    = Input::get('type');
        $post->user_id = Input::get('user_id');

        $post->save();

        return Response::Make('POST_ADD_SUCCESSFUL');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id) {
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id) {
        $post = Post::findOrFail($id);

        $post->title   = Input::get('title');
        $post->content = Input::get('content');
        $post->type    = Input::get('type');

        $post->save();

        return Response::Make('POST_UPDATE_SUCCESSFUL');
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id) {
        $post = Post::findOrFail($id);
        $post->delete();

        return Response::Make('POST_DELETE_SUCCESSFUL');
	}

    public function reply() {

    }

    public function like() {

    }

}