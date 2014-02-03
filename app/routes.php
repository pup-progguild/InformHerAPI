<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

// TODO: DESU.

Route::get('/', function () {
	return View::make('home');
});

/*
 * InformHer API routes/ endpoints
 *
 */

Route::model("post", "Post");
Route::model("user", "User");
Route::model("comment", "Comment");
Route::model("tag", "Tag");

/*Route::get("post/{post}/comments/{comment}", [
	"as"   => "post/{post}/comments/{comment}",
	"uses" => "CommentController@show"
]);*/


Route::group(["prefix" => "post"], function () {
	Route::get("/", [
		"as"   => "post/index",
		"uses" => "PostController@index"
	]);

	Route::get("/{post}", [
		"as"   => "GetPost",
		"uses" => "PostController@show"
	]);

	Route::get("/{post}/comments", [
		"as"   => "GetAllCommentsFromPost",
		"uses" => "PostController@comments"
	]);

	Route::get("/{post}/tags", [
		"as"   => "GetAllTagsFromPost",
		"uses" => "PostController@tags"
	]);

	Route::group(["before" => "auth.basic"], function () {
		Route::post("/ask", [
			"as"   => "PostInAsk",
			"uses" => "PostController@store"
		]);
		Route::post("/relate", [
			"as"   => "PostInRelate",
			"uses" => "PostController@store"
		]);

		Route::post("/shoutout", [
			"as"   => "PostInShoutout",
			"uses" => "PostController@storeShoutout"
		]);

		Route::put("/{post}/update", [
			"as"   => "UpdatePost",
			"uses" => "PostController@update"
		]);

		Route::delete("/{post}", [
			"as"   => "DeletePost",
			"uses" => "PostController@destroy"
		]);

		Route::get('/test', function () {
			return View::make('test');
		});
	});
});


Route::group(["prefix" => "user"], function () {
	Route::get("/login", [
		"as"   => "UserLogin",
		"uses" => "UserController@login"
	]);

	Route::get("/logout", [
		"as"   => "UserLogout",
		"uses" => "UserController@logout"
	]);

	Route::post("/register", [
		"as"   => "UserRegistration",
		"uses" => "UserController@create"
	]);

	Route::group(["before" => "auth.basic"], function () {
		Route::get("/profile", [
			"as"   => "GetUserProfileInfo",
			"uses" => "UserController@index"
		]); // XXX this route isn't restful at all. >___>

		Route::get("/{user}", [
			"as"   => "GetUserInfo",
			"uses" => "UserController@show"
		]);

		Route::put("/{user}", [
			"as"   => "user/update",
			"uses" => "UserController@update"
		]);

		Route::delete("/{user}", [
			"as"   => "user/destroy",
			"uses" => "UserController@destroy"
		]);
	});
});


