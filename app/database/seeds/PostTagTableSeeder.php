<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 3:19 PM
 */
class PostTagTableSeeder extends Seeder {
	public function run() {
		$post_tags = array(
			[
				'post_id'   =>  1,
			    'tag_id'    =>  1
			],
			[
				'post_id' => 1,
				'tag_id'  => 2
			],
			[
				'post_id' => 2,
				'tag_id'  => 5
			],
			[
				'post_id' => 3,
				'tag_id'  => 2
			],
			[
				'post_id' => 4,
				'tag_id'  => 3
			],
			[
				'post_id' => 5,
				'tag_id'  => 6
			]
		);

		foreach ($post_tags as $post_tag) {
			PostTag::create($post_tag);
		}
	}
}