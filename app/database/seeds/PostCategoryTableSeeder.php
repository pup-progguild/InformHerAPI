<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 2/7/14
 * Time: 6:20 AM
 */

class PostCategoryTableSeeder extends Seeder {
	public function run() {
		$post_categories = array(
			[
				'post_id'       =>  1,
			    'category_id'   =>  1
			],
			[
				'post_id'     => 2,
				'category_id' => 1
			],
			[
				'post_id'     => 3,
				'category_id' => 2
			],
			[
				'post_id'     => 4,
				'category_id' => 2
			],
			[
				'post_id'     => 5,
				'category_id' => 1
			],
		);

		foreach ($post_categories as $post_category) {
			PostCategory::create($post_category);
		}

	}
}