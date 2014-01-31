<?php

    use Illuminate\Database\Migrations\Migration;

    class CreateTables extends Migration {

        /**
         * Run the migrations.
         *
         * @return void
         */
        public function up() {
            Schema::create('users', function ($t) {
                $t->increments('id');
                $t->string('username', 35)->unique();
                $t->string('password', 60);
                $t->string('email', 100);
                $t->string('twt_handle', 15);
                $t->timestamps();
            });

            Schema::create('roles', function ($table) {
                $table->increments('id');
                $table->string('name');
                $table->timestamps();
            });

            // Creates the assigned_roles (Many-to-Many relation) table
            Schema::create('assigned_roles', function ($table) {
                $table->increments('id');
                $table->integer('user_id')->unsigned()->index();
                $table->integer('role_id')->unsigned()->index();
                $table->foreign('user_id')->references('id')->on('users');
                $table->foreign('role_id')->references('id')->on('roles');
            });

            Schema::create('posts', function ($t) {
                $t->increments('id');
                $t->string('title', 140);
                $t->text('content');
                $t->string('geolocation', 50)->nullable();
                $t->string('srclink', 255)->nullable();
                $t->integer('user_id')->unsigned();
                $t->foreign('user_id')->references('id')->on('users');
                $t->timestamps();
                $t->softDeletes();
            });

            Schema::create('categories', function($t) {
                $t->increments('id');
                $t->string('name');
                $t->text('description');
                $t->timestamps();
            });

            Schema::create('post_category', function($t) {
                $t->increments('id');
                $t->integer('post_id')->unsigned();
                $t->foreign('post_id')->references('id')->on('posts');
                $t->integer('category_id')->unsigned();
                $t->foreign('category_id')->references('id')->on('categories');
            });

            Schema::create('tags', function ($t) {
                $t->increments('id');
                $t->string('tagname')->unique();
            });

            Schema::create('post_tags', function ($t) {
                $t->increments('id');
                $t->integer('post_id')->unsigned();
                $t->foreign('post_id')->references('id')->on('posts');
                $t->integer('tag_id')->unsigned();
                $t->foreign('tag_id')->references('id')->on('tags');
            });

            Schema::create('comments', function ($t) {
                $t->increments('id');
                $t->text('message');
                $t->integer('user_id')->unsigned();
                $t->foreign('user_id')->references('id')->on('users');
                $t->integer('post_id')->unsigned();
                $t->foreign('post_id')->references('id')->on('posts');
                $t->timestamps();
                $t->softDeletes();
            });

            Schema::create('likes', function ($t) {
                $t->increments('id');
                $t->integer('post_id')->unsigned();
                $t->foreign('post_id')->references('id')->on('posts');
                $t->integer('comment_id')->unsigned();
                $t->foreign('comment_id')->references('id')->on('comments');
                $t->integer('user_id')->unsigned();
                $t->foreign('user_id')->references('id')->on('users');
            });

            Schema::create('sessions', function ($t) {
                $t->string('id')->unique();
                $t->text('payload');
                $t->integer('last_activity');
                $t->timestamps();
            });

            Schema::create('sessions', function ($t) {
                $t->string('id')->unique();
                $t->integer('last_activity');
                $t->timestamps();
            });

            Schema::create('password_reminders', function ($t) {
                $t->string('email')->index();
                $t->string('token')->index();
                $t->timestamp('created_at');
            });
        }

        /**
         * Reverse the migrations.
         *
         * @return void
         */
        public function down() {
            Schema::drop('users');
            Schema::drop('roles');
            Schema::drop('assigned_roles');
            Schema::drop('posts');
            Schema::drop('tags');
            Schema::drop('likes');
            Schema::drop('post_tags');
            Schema::drop('comments');
            Schema::drop('likes');
            Schema::drop('sessions');
            Schema::drop('password_reminders');
        }
    }
