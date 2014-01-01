<?php

use Illuminate\Database\Migrations\Migration;

class CreateTables extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function($t) {
			$t->increments('id');
			$t->string('username', 35)->unique();
			$t->string('password', 60);
			$t->string('email', 100);
			$t->enum('role',['admin','mod-exp','mod','expert','user']);
			$t->timestamps();
		});

		Schema::create('posts', function($t) {
			$t->increments('id');
			$t->enum('type', ['ask','relate','shoutout']);
			$t->string('title', 140);
			$t->text('content');
			$t->timestamps();
			$t->softDeletes();
		});

		Schema::create('tags', function($t) {
			$t->increments('id');
			$t->string('tagname')->unique();
		});

		Schema::create('post_tags', function($t) {
			$t->integer('post_id')->unsigned();
			$t->foreign('post_id')->references('id')->on('posts');
			$t->integer('tag_id')->unsigned();
			$t->foreign('tag_id')->references('id')->on('tags');
		});

		Schema::create('sessions', function($t)	{
			$t->string('id')->unique();
			$t->text('payload');
			$t->integer('last_activity');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('users');
		Schema::drop('posts');
		Schema::drop('tags');
		Schema::drop('post_tags');
		Schema::drop('sessions');
	}
}
