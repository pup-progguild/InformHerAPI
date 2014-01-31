<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 3:32 PM
 */

class PostLikeTableSeeder extends Seeder {
	public function run() {
		$post_likes = array(
			[
				'post_id' => 1,
				'user_id' => 1
			],
			[
				'post_id' => 1,
				'user_id' => 2
			],
			[
				'post_id' => 1,
				'user_id' => 3
			],
			[
				'post_id' => 2,
				'user_id' => 1
			],
			[
				'post_id' => 1,
				'user_id' => 3
			]
		);

		foreach ($post_likes as $post_like) {
			PostLike::create($post_like);
		}
	}
}