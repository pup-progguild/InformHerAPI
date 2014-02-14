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
	//return View::make('test');
	//Cache::remember('test', 15, function() {
		$post = Post::all();

		echo Response::json([
			'posts' => $post->toArray()
		]);
	//});
})->before('auth.basic'); //->before('auth.basic');

Route::get('/test2', function () {
	//return View::make('test');
	//Cache::remember('test', 15, function() {
	$post = Post::all();

	echo Response::json([
		'posts' => $post->toArray()
	]);
	//});
})->before('auth.standard'); //->before('auth.basic');

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

Route::group(['prefix' => 'oauth'], function() {
	Route::post('/access_token', function () {
		return AuthorizationServer::performAccessTokenFlow();
	});

	Route::get('/authorize', array(
		'before' => 'check-authorization-params|auth', function () {
			// get the data from the check-authorization-params filter
			$params = Session::get('authorize-params');

			// get the user id
			$params['user_id'] = Auth::user()->id;

			// display the authorization form
			return View::make('authorization-form', array('params' => $params));
		}
	));

	Route::post('/authorize', array(
		'before' => 'check-authorization-params|auth|csrf', function () {
			// get the data from the check-authorization-params filter
			$params = Session::get('authorize-params');

			// get the user id
			$params['user_id'] = Auth::user()->id;

			// check if the user approved or denied the authorization request
			if (Input::get('approve') !== null) {

				$code = AuthorizationServer::newAuthorizeRequest('user', $params['user_id'], $params);

				Session::forget('authorize-params');

				return Redirect::to(AuthorizationServer::makeRedirectWithCode($code, $params));
			}

			if (Input::get('deny') !== null) {

				Session::forget('authorize-params');

				return Redirect::to(AuthorizationServer::makeRedirectWithError($params));
			}
		}
	));
});

Route::group(["prefix" => "post"], function () {
	Route::get("/", [
		"as"   => "Posts",
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
		Route::post("/", [
			"as"   => "Post",
			"uses" => "PostController@store"
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
	Route::get('/', [
		'as'    =>  'Tags',
	    'uses'  =>  'TagController@index'
	]);

	Route::post('/', [
		'as'   => 'AddTags',
		'uses' => 'TagController@index'
	]);

	Route::delete('/', [
		'as'   => 'DeleteTag',
		'uses' => 'TagController@destroy'
	]);
});

Route::group(['prefix' => 'category'], function () {
	Route::get('/', [
		'as'    =>  'Categories',
	    'uses'  =>  'CategoryController@index'
	]);

	Route::post('/', [
		'as'    =>  'AddCategory',
	    'uses'  =>  'CategoryController@store'
	]);

	Route::delete('/', [
		'as'    =>  'DeleteCategory',
	    'uses'  =>  'CategoryController@destroy'
	]);
});

// Confide RESTful route
Route::get('user/confirm/{code}', 'UserController@getConfirm');
Route::get('user/reset/{token}', 'UserController@getReset');
Route::controller( 'user', 'UserController');
