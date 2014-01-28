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

Route::get('/', function() {
	return View::make('home');
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

Route::model("user", "User");

Route::get("user/login", [
    "as"    =>  "user/login",
    "uses"  =>  "UserController@login"
]);

Route::get("user/logout", [
    "as"    =>  "user/logout",
    "uses"  =>  "UserController@logout"
]);