<?php

class CommentController extends BaseController {

	protected $comment;

	public function __construct(Comment $comment) {
		$this->comment = $comment;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index() {
		$comments = $this->comment;

		$post_count = $comments->count();

		$comments = $comments->get();

		$comments_a = [
			'count'  => $post_count,
			'result' => $comments->toArray()
		];

		if ($post_count != 0) {
			return Response::json([
				'status' => 'COMMENTS_SHOW_SUCCESSFUL',
				'posts'  => $comments_a
			], 200);
		}
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  Comment $comment
	 * @return Response
	 */
	public function show(Comment $comment) {      //TODO - wrong logic

		if ($comment->count() == 0) {
			return Response::json(array(
					'status'      => 'COMMENT_SHOW_FAILED',
					'description' => "Comment {$comment->id} not found."
				), 404
			);
		}

		return Response::json(array(
				'status' => 'COMMENT_SHOW_SUCCESSFUL',
				'posts'  => $comment->toArray()
			), 200
		);
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  Comment $comment
	 * @return Response
	 */
	public function destroy(Comment $comment) {
		if($comment->isTheAuthor() or Entrust::hasRole('Moderator')) {
			if ($comment->delete()) {
				return Response::json([
					'status' => 'POST_COMMENT_DELETE_SUCCESSFUL'
				], 200);
			}
		}

		return Response::json([
			'status' => 'POST_COMMENT_DELETE_FAILED',
		    'description'   =>  'Either you don\'t have enough permissions, or the resource you are accessing isn\'t available.'
		], 500);
	}

}