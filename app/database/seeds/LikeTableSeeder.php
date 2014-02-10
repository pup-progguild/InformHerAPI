<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 2/11/14
 * Time: 3:27 AM
 */

class LikeTableSeeder extends Seeder {
	public function run() {
		$likes = [
			[
				'user_id'           =>  1,
			    'imageable_id'      =>  1,
			    'imageable_type'    =>  'post'
			],
			[
				'user_id'        => 1,
				'imageable_id'   => 2,
				'imageable_type' => 'post'
			],
			[
				'user_id'        => 1,
				'imageable_id'   => 1,
				'imageable_type' => 'comment'
			],

			[
				'user_id'        => 2,
				'imageable_id'   => 1,
				'imageable_type' => 'post'
			],
			[
				'user_id'        => 2,
				'imageable_id'   => 3,
				'imageable_type' => 'post'
			],
			[
				'user_id'        => 2,
				'imageable_id'   => 3,
				'imageable_type' => 'comment'
			],

			[
				'user_id'        => 3,
				'imageable_id'   => 1,
				'imageable_type' => 'comment'
			],
			[
				'user_id'        => 3,
				'imageable_id'   => 2,
				'imageable_type' => 'post'
			],
			[
				'user_id'        => 3,
				'imageable_id'   => 3,
				'imageable_type' => 'post'
			],
		];

		foreach ($likes as $like) {
			Like::create($like);
		}
	}
}