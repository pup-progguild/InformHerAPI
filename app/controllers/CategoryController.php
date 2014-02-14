<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 2/14/14
 * Time: 3:24 PM
 */

class CategoryController extends BaseController {

	protected $category;

	public function __construct(Category $category) {
		$this->category = $category;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index() {
		$category = $this->category->all();

		if($category->count() != 0) {
			return Response::json([
				'status'        =>  'CATEGORY_SHOW_SUCCESS',
			    'categories'    =>  $category->toArray()
			], 200);
		}

		return Response::json([
			'status'        =>  'CATEGORY_SHOW_FAILED',
		    'description'   =>  'Category entry list empty'
		]);
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @param   id $id
	 * @return Response
	 */
	public function create($id) {

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
	 * @param  int $id
	 * @return Response
	 */
	public function show($id) { //TODO - wrong logic

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
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int $id
	 * @return Response
	 */
	public function destroy($id) {
		//
	}
}