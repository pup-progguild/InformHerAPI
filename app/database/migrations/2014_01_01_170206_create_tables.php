<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateTables extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up() {
		Schema::create('users', function (Blueprint $t) {
			$t->increments('id');
			$t->string('username', 35)->unique();
			$t->string('password');
			$t->string('email', 100);
			$t->string('confirmation_code');
			$t->boolean('confirmed')->default(false);
			$t->timestamps();
		});

		Schema::create('profiles', function (Blueprint $t) {
			$t->increments('id');
			$t->string('badge');
			$t->string('twt_handle');
			$t->string('facebook_username');
			$t->string('bio');
			$t->string('hompage_url');
			$t->integer('user_id')->unsigned();
			$t->foreign('user_id')->references('id')->on('users');
			$t->timestamps();
		});

		Schema::create('properties', function (Blueprint $t) {
			$t->increments('id');
			$t->tinyInteger('is_shown');
			$t->tinyInteger('is_featured');
			$t->string('approved_by');
			$t->morphs('properties');
			$t->timestamps();
		});

		Schema::create('roles', function (Blueprint $t) {
			$t->increments('id')->unsigned();
			$t->string('name')->unique();
			$t->string('description');
			$t->timestamps();
		});

		// Creates the assigned_roles (Many-to-Many relation) table
		Schema::create('assigned_roles', function (Blueprint $t) {
			$t->increments('id')->unsigned();
			$t->integer('user_id')->unsigned();
			$t->integer('role_id')->unsigned();
			$t->foreign('user_id')->references('id')->on('users'); // assumes a users table
			$t->foreign('role_id')->references('id')->on('roles');
		});

		// Creates the permissions table
		Schema::create('permissions', function (Blueprint $t) {
			$t->increments('id')->unsigned();
			$t->string('name');
			$t->string('display_name');
			$t->timestamps();
		});

		// Creates the permission_role (Many-to-Many relation) table
		Schema::create('permission_role', function (Blueprint $t) {
			$t->increments('id')->unsigned();
			$t->integer('permission_id')->unsigned();
			$t->integer('role_id')->unsigned();
			$t->foreign('permission_id')->references('id')->on('permissions'); // assumes a users table
			$t->foreign('role_id')->references('id')->on('roles');
		});

		Schema::create('categories', function (Blueprint $t) {
			$t->increments('id');
			$t->string('name');
			$t->text('description');
			$t->timestamps();
		});

		Schema::create('posts', function (Blueprint $t) {
			$t->increments('id');
			$t->string('title', 140);
			$t->text('content');
			$t->string('geolocation', 50)->nullable();
			$t->string('srclink')->nullable();
			$t->integer('user_id')->unsigned();
			$t->foreign('user_id')->references('id')->on('users');
			$t->integer('category_id')->unsigned();
			$t->foreign('category_id')->references('id')->on('categories');
			$t->timestamps();
			$t->softDeletes();
		});

		Schema::create('tags', function (Blueprint $t) {
			$t->increments('id');
			$t->string('tagname')->unique();
			$t->timestamps();
		});

		Schema::create('post_tags', function (Blueprint $t) {
			$t->increments('id');
			$t->integer('post_id')->unsigned();
			$t->foreign('post_id')->references('id')->on('posts');
			$t->integer('tag_id')->unsigned();
			$t->foreign('tag_id')->references('id')->on('tags');
		});

		Schema::create('comments', function (Blueprint $t) {
			$t->increments('id');
			$t->text('message');
			$t->integer('user_id')->unsigned();
			$t->foreign('user_id')->references('id')->on('users');
			$t->integer('post_id')->unsigned();
			$t->foreign('post_id')->references('id')->on('posts');
			$t->timestamps();
			$t->softDeletes();
		});

		Schema::create('likes', function (Blueprint $t) {
			$t->increments('id');
			$t->integer('user_id')->unsigned();
			$t->foreign('user_id')->references('id')->on('users');
			$t->morphs('likeable');
			$t->timestamps();
		});

		Schema::create('sessions', function (Blueprint $t) {
			$t->string('id')->unique();
			$t->text('payload');
			$t->integer('last_activity');
		});

		Schema::create('password_reminders', function (Blueprint $t) {
			$t->string('email')->index();
			$t->string('token')->index();
			$t->timestamp('created_at');
		});

		Schema::create('cache', function (Blueprint $t) {
			$t->string('key')->unique();
			$t->text('value');
			$t->integer('expiration');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down() {
		Schema::table('assigned_roles', function (Blueprint $t) {
			$t->dropForeign('assigned_roles_user_id_foreign');
			$t->dropForeign('assigned_roles_role_id_foreign');
		});

		Schema::table('permission_role', function (Blueprint $t) {
			$t->dropForeign('permission_role_permission_id_foreign');
			$t->dropForeign('permission_role_role_id_foreign');
		});

		Schema::table('profiles', function (Blueprint $t) {
			$t->dropForeign('profiles_user_id_foreign');
		});

		Schema::table('likes', function(Blueprint $t) {
			$t->dropForeign('likes_user_id_foreign');
		});

		Schema::table('posts', function(Blueprint $t) {
			$t->dropForeign('posts_user_id_foreign');
		});

		Schema::table('post_tags', function (Blueprint $t) {
			$t->dropForeign('post_tags_post_id_foreign');
			$t->dropForeign('post_tags_tag_id_foreign');
		});

		Schema::drop('users');
		Schema::drop('roles');
		Schema::drop('permissions');
		Schema::drop('posts');
		Schema::drop('categories');
		Schema::drop('tags');
		Schema::drop('comments');

		Schema::drop('post_likes');
		Schema::drop('comment_likes');

		Schema::drop('likes');

		Schema::drop('post_tags');

		Schema::drop('assigned_roles');
		Schema::drop('permission_role');

		Schema::drop('sessions');
		Schema::drop('password_reminders');
		Schema::drop('cache');
	}
}
