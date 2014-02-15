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

Route::post('/test', function () {
	$post = new Post;

	if (is_null($post)) {
		$post   = $this->post;
		$status = 'POST_ADD';
	} else {
		$status = 'POST_UPDATE';
	}

	$input = Input::all();

	$category = Category::where('name', '=', 'ask')->firstOrFail();

	$tags = Tag::whereIn('tagname', $input['tags'])->lists('id');

	$post->title   = $input['title'];
	$post->content = $input['content'];
	$post->user_id = 4;

	$post->category()->associate($category);

	$post->save();

	$post->tags()->sync($tags);


	// if ($post->save()) {return Response::json([ 				'status' => $status . '_SUCCESSFUL',				'posts'  => $post->toArray() 			], 201); }

	echo Response::json([
		'title' => $post->title,
	    'content' => $post->content,
	    'user_id' => $post->user_id,
	    'category' => $post->category->name,
	    'tags' => $post->tags->toArray()
	]);
});

Route::get('/test', function () {
	//return View::make('test');
	//Cache::remember('test', 15, function() {

	$serializethis = ['one', 'two', 'three'];

	$tags = serialize($serializethis);

	echo $tags;
	//});
})->before('auth'); //->before('auth.basic');

/* InformHer API routes & endpoints */
Route::model("post", "Post");
Route::model("comment", "Comment");
Route::model("tag", "Tag");

/*

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

*/

Route::group(["prefix" => "posts"], function () {
	Route::get("/", [
		"as"   => "Posts",
		"uses" => "PostController@index"
	]);

	Route::get("/{post}", [
		"as"   => "GetPost",
		"uses" => "PostController@show"
	]);

	Route::get("/{post}/comments/{comment?}", [
		"as"   => "GetCommentsFromPost",
		"uses" => "PostController@comments"
	]);

	Route::get("/{post}/tags", [
		"as"   => "GetAllTagsFromPost",
		"uses" => "PostController@tags"
	]);

	Route::get("/{post}/likes", [
		"as"   => "GetAllLikesFromPost",
	    "uses" => "PostController@like"
	]);

	Route::group(["before" => "auth"], function () {
		Route::post("/{post?}", [
			"as"   => "CreateEditPost",
			"uses" => "PostController@create_edit"
		]);

		Route::post("/{post}/comment/{comment?}", [
			"as"   => "CreateUpdateComment",
			"uses" => "PostController@create_update_comment"
		]);

		Route::delete("/{post}", [
			"as"   => "DeletePost",
			"uses" => "PostController@destroy"
		]);

		Route::delete("/{post}/comments/{comment?}", [
			"as"   => "DeletePostComment",
			"uses" => "PostController@delete_comment"
		]);
	});
});

//Route::group(["prefix" => "comments"], function () {
//	Route::get('/', [
//		'as'    =>  'Comments',
//	    'uses'  =>  'CommentController@index'
//	]);
//
//	Route::group(["before" => "auth"], function () {
//		Route::put('/{comment}', [
//			'as'   => 'UpdateComment',
//		    'uses' => 'CommentController@update'
//		]);
//
//		Route::delete('/{comment}', [
//			'as'   => 'DeleteComment',
//			'uses' => 'CommentController@destroy'
//		]);
//	});
//});

Route::group(['prefix' => 'tags'], function () {
	Route::get('/', [
		'as'    =>  'Tags',
	    'uses'  =>  'TagController@index'
	]);

	Route::group(["before" => "auth"], function () {
		Route::post('/', [
			'as'   => 'AddTags',
			'uses' => 'TagController@store'
		]);

		Route::put('/{tag}', [
			'as'   => 'UpdateTags',
			'uses' => 'TagController@update'
		]);

		Route::delete('/{tag}', [
			'as'   => 'DeleteTag',
			'uses' => 'TagController@destroy'
		]);
	});
});

Route::group(['prefix' => 'category'], function () {
	Route::get('/', [
		'as'    =>  'Categories',
	    'uses'  =>  'CategoryController@index'
	]);

	Route::group(["before" => "auth"], function () {
		Route::post('/', [
			'as'   => 'AddCategory',
			'uses' => 'CategoryController@store'
		]);

		Route::put('/{category}', [
			'as'   => 'UpdateCategory',
			'uses' => 'CategoryController@update'
		]);

		Route::delete('/{category}', [
			'as'   => 'DeleteCategory',
			'uses' => 'CategoryController@destroy'
		]);
	});
});

// Confide RESTful route
Route::get('user/confirm/{code}', 'UserController@getConfirm');
Route::get('user/reset/{token}', 'UserController@getReset');
Route::controller( 'user', 'UserController');
