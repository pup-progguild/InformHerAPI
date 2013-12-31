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

Route::get('/', function()
{
	return View::make('hello');
});

Route::get('index', function() {
	return View::make('home');
});

Route::get('posts', function() {
	return 'TODO POSTS';
});

Route::get('posts/{name}', function($name) {
	return "TODO POSTS on item # {$name}.";
});
