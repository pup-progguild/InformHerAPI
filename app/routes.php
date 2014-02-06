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

Route::get('/test', function () {
	return View::make('test');
});

/*
 * InformHer API routes/ endpoints
 *
 */

Route::model("post", "Post");
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
	});
});

Route::group(['prefix' => 'tags'], function () {
	Route::get("/", [
		"as"    =>  "Tags",
	    "uses"  =>  "TagController@index"
	]);
});


// Confide RESTful route
Route::get('user/confirm/{code}', 'UserController@getConfirm');
Route::get('user/reset/{token}', 'UserController@getReset');
Route::controller( 'user', 'UserController');
