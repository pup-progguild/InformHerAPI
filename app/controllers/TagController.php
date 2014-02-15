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
	public function store() {
		//
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
	 * Show the form for editing the specified resource.
	 *
	 * @param  Tag $id
	 * @return Response
	 */
	public function edit(Tag $id) {
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  Tag $id
	 * @return Response
	 */
	public function update(Tag $id) {
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  Tag $id
	 * @return Response
	 */
	public function destroy(Tag $id) {
		//
	}

}