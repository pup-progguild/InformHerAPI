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

Route::get('/', function()
{
	return View::make('hello');
});

Route::get('index', function() {
	return View::make('home');
});

Route::get('seed', function() {
	$post = new Post;
	$post->type = 'ask';
	$post->title = 'Is it right to ask me anything without saying anything at all? #ask';
	$post->content = 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.';
    $post->user_id = 1;

	$post->save();
});

Route::model("post", "Post");

Route::get("post", [
    "as"   => "post/index",
    "uses" => "PostController@index"
]);

Route::get("post/{post}", [
    "as"   => "post/show",
    "uses" => "PostController@show"
]);

Route::group(["before"  =>  "auth.basic"], function() {
    Route::post("post", [
        "as"   => "post/store",
        "uses" => "PostController@store"
    ]);



    Route::put("post/{post}", [
        "as"   => "post/update",
        "uses" => "PostController@update"
    ]);

    Route::delete("post/{post}", [
        "as"   => "post/destroy",
        "uses" => "PostController@destroy"
    ]);
});


