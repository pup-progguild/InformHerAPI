<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 2:52 PM
 */

class CommentLikeTableSeeder extends Seeder {
	public function run() {
		$comment_likes = array(
			[
				'comment_id' =>  1,
			    'user_id'    =>  1
		    ],
			[
				'comment_id' => 1,
				'user_id'    => 2
			],
			[
				'comment_id' => 2,
				'user_id'    => 1
			],
			[
				'comment_id' => 2,
				'user_id'    => 2
			],
		    [
			    'comment_id' =>  3,
		        'user_id'    =>  3
		    ]
		);

		foreach ($comment_likes as $comment_like) {
			CommentLike::create($comment_like);
		}
	}
}