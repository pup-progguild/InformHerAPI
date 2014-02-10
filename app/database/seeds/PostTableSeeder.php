<?php

/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/24/14
 * Time: 1:42 AM
 */
class PostTableSeeder extends Seeder {
	public function run() {
		$posts = array(
			[
				'title'   => 'Is it normal for women to submit to men?',
				'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
				'user_id' => '1',
			    'category_id'   =>  '1'
			],
			[
				'title'   => 'Is it alright to ask a question here?',
				'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
				'user_id' => '2',
				'category_id' => '1'
			],
			[
				'title'   => 'I am a Doctor. Ask me anything',
				'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
				'user_id' => '1',
				'category_id' => '1'
			],
			[
				'title'   => 'I am a Teacher. Ask me anything',
				'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
				'user_id' => '2',
				'category_id' => '2'
			],
			[
				'title'   => 'I am a Soldier. Ask me anything',
				'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
				'user_id' => '3',
				'category_id' => '2'
			]
		);

		foreach ($posts as $post) {
			Post::create($post);
		}
	}
}