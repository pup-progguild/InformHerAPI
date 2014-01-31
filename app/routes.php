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

Route::get('test', function () {
	return View::make('test');
});

/*
 * InformHer API routes/ endpoints
 *
 */

Route::model("post", "Post");
Route::model("user", "User");
Route::model("comment", "Comment");
Route::model("tag", "Tag");

Route::get("post", [
	"as"   => "post/index",
	"uses" => "PostController@index"
]);

Route::get("post/{post}", [
	"as"   => "post/{post}",
	"uses" => "PostController@show"
]);

Route::get("post/{post}/comments", [
	"as"    => "post/{post}/comments",
    "uses"  => "PostController@comments"
]);

Route::get("post/{post}/tags", [
	"as"   => "post/{post}/tags",
	"uses" => "PostController@tags"
]);

Route::get("post/{post}/comments/{comment}", [
	"as"   => "post/{post}/comments/{comment}",
	"uses" => "CommentController@show"
]);

Route::group(["before" => "auth.basic"], function () {
	Route::post("post/ask", [
		"as"   => "post/ask",
		"uses" => "PostController@store"
	]);

	Route::post("post/relate", [
		"as"   => "post/relate",
		"uses" => "PostController@store"
	]);

	Route::post("post/shoutout", [
		"as"   => "post/shoutout",
		"uses" => "PostController@storeShoutout"
	]);

	Route::put("post/{post}/update", [
		"as"   => "post/{post}",
		"uses" => "PostController@update"
	]);

	Route::delete("post/{post}", [
		"as"   => "post/{post}",
		"uses" => "PostController@destroy"
	]);
});

Route::get("user/login", [
	"as"   => "user/login",
	"uses" => "UserController@login"
]);

Route::get("user/logout", [
	"as"   => "user/logout",
	"uses" => "UserController@logout"
]);

Route::post("user", [
	"as"   => "user/register",
	"uses" => "UserController@create"
]);

Route::group(["before" => "auth.basic"], function () {

	Route::get("user/profile", [
		"as"   => "user/profile",
		"uses" => "UserController@index"
	]);

	Route::get("user/{user}", [
		"as"   => "user/show",
		"uses" => "UserController@show"
	]);

	Route::put("user/{user}", [
		"as"   => "user/update",
		"uses" => "UserController@update"
	]);

	Route::delete("user/{user}", [
		"as"   => "user/destroy",
		"uses" => "UserController@destroy"
	]);
});

