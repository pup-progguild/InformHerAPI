<?php
/**
 * Created by PhpStorm.
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:42 AM
 */ 
class PostsController extends BaseController {
	public function add() {
		$post = new Post;

		$post->title = Input::get('title');
		$post->content = Input::get('content');
		$post->type = Input::get('type');
		$post->user_id = Input::get('user_id');

		$post->save();

		return Response::Make('POST_ADD_SUCCESSFUL');
	}

	public function update() {
		$post = Post::findOrFail(Input::get('id'));

		$post->title = Input::get('title');
		$post->content = Input::get('content');
		$post->type = Input::get('type');

		$post->save();

		return Response::Make('POST_UPDATE_SUCCESSFUL');
	}

	public function delete() {
		$id = Input::get('post');

		$post = Post::findOrFail($id);
		$post->delete();

		return Response::Make('POST_DELETE_SUCCESSFUL');
	}

	public function reply() {

	}

	public function like() {

	}
}
