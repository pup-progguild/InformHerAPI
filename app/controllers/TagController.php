<?php

class TagController extends BaseController {

	protected $tag;

	public function __construct(Tag $tag) {
		$this->tag = $tag;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index() {
		$tag = $this->tag->all();

		if ($tag->count() != 0) {
			return Response::json([
					"status" => "TAG_SHOW_SUCCESS",
					"tags"   => $tag->toArray()
				], 200
			);
		}

		return Response::json([
			"status"      => "TAG_SHOW_FAILED",
			"description" => "Tag list empty"
		], 404);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function create_edit(Tag $tag = null) {
		if (is_null($tag)) {
			$tag = $this->tag;
			$status = 'TAG_ADD';
		} else {
			$status = 'TAG_UPDATE';
		}

		$input = Input::all();

		$tagname = $input['tagname'];

		$isTagExist = Tag::where('tagname', '=', $tagname)->exists();

		if($isTagExist) {
			return Response::json([
				'status'        => $status . '_FAILED',
			    'description'   => 'Tag, ' . $tagname . ' already exist in InformHer'
			], 200);
		}

		$tag->tagname = $tagname;

		if($tag->save()) {
			return Response::json([
				'status'        => $status . '_SUCCESSFUL',
			    'description'   => 'Tag, ' . $tagname . ' added to InformHer'
			], 201);
		}

		return Response::json([
			'status'        =>  $status . '_FAILED',
		    'description'   =>  'Unknown error'
		], 200);
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  Tag $id
	 * @return Response
	 */
	public function show(Tag $id) { //TODO - wrong logic

	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  Tag $tag
	 *
*@return Response
	 */
	public function destroy(Tag $tag) {
		$tagname = $tag->tagname;

		$posts = Post::whereHas('Tags', function ($q) use ($tagname) {
			$q->where('tagname', '=', $tagname);
		})->get();

		foreach ($posts as $post) {
			$post->tags()->detach($tag->id);
		}

		if($tag->delete()) {
			return Response::json([
				'status'    =>  'TAG_DELETE_SUCCESSFUL',
			    'description'   => 'Tag, ' . $tagname . ' detached from associated posts, and deleted.'
			], 200);
		}

	}

}
