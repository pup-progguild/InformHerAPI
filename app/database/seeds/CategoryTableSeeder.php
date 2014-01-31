<?php

/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 12:25 PM
 */
class CategoryTableSeeder extends Seeder {
	public function run() {
		$categories = array(
			[
				'name'        => 'ask',
				'description' => 'Something to ask? Want to be asked? Do it here!'
			],
			[
				'name'        => 'relate',
				'description' => 'Want to share something? Want to let them know about it? Post it!'
			],
			[
				'name'        => 'shoutout',
				'description' => 'Abused? In pain? You think you are being left out at work? Report it.'
			]
		);

		foreach ($categories as $category) {
			Category::create($category);
		}

	}
}