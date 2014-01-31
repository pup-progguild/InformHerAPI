<?php

class CommentsTableSeeder extends Seeder {

	protected $content1 = 'Lorem ipsum dolor sit amet, mutat utinam nonumy ea mel.';
	protected $content2 = 'Lorem ipsum dolor sit amet, sale ceteros liberavisse duo ex, nam mazim maiestatis dissentiunt no. Iusto nominavi cu sed, has.';
	protected $content3 = 'Et consul eirmod feugait mel! Te vix iuvaret feugiat repudiandae. Solet dolore lobortis mei te, saepe habemus imperdiet ex vim. Consequat signiferumque per no, ne pri erant vocibus invidunt te.';


	public function run() {
		$user_id = User::first()->id;
		$post_id = Post::first()->id;

		$comments = array(
			array(
				'user_id' => $user_id,
				'post_id' => $post_id,
				'message' => $this->content1
			),
			array(
				'user_id' => $user_id,
				'post_id' => $post_id,
				'message' => $this->content2
			),
			array(
				'user_id' => $user_id,
				'post_id' => $post_id,
				'message' => $this->content3
			),
			array(
				'user_id' => $user_id,
				'post_id' => $post_id + 1,
				'message' => $this->content1
			),
			array(
				'user_id' => $user_id,
				'post_id' => $post_id + 1,
				'message' => $this->content2
			),
			array(
				'user_id' => $user_id,
				'post_id' => $post_id + 2,
				'message' => $this->content1
			)
		);

		foreach ($comments as $comment) {
			Comment::create($comment);
		}

	}

}
