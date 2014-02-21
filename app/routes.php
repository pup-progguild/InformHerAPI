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
/*	$post = new Post;

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
	]);*/
});

Route::get('/test', function () {
	//return View::make('test');
	//Cache::remember('test', 15, function() {

	$post = Post::find(1);

	return Response::json([
		$post->properties->filter(function($post) {
			return $post->is_shown;
		})->toArray()
	]);
	//});
}); //->before('auth.basic');

/* InformHer API routes & endpoints */
Route::model("post", "Post");
Route::model("comment", "Comment");
Route::model("tag", "Tag");
Route::model("user", "User");

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
		"as"   => "GetAllPosts",
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
	    "uses" => "PostController@likes",
	]);

	Route::get("/{post}/comments/{comment}/likes", [
		"as"   => "GetAllLikesFromComment",
	    "uses" => "PostController@likes"
	]);

	Route::group(["before" => "auth"], function () {
		Route::post("/{post?}", [
			"as"   => "CreateEditPost",
			"uses" => "PostController@create_edit"
		]);

		Route::post("/{post}/comments/{comment?}", [
			"as"   => "CreateUpdateComment",
			"uses" => "PostController@create_update_comment"
		]);

		Route::post("/{post}/like", [
			"as"   => "LikePost",
		    "uses" => "PostController@like",
		]);

		Route::post("/{post}/comments/{comment}/like", [
			"as"   => "LikePostComment",
		    "uses" => "PostController@like"
		]);

		Route::delete("/{post}/comments/{comment?}", [
			"as"   => "DeletePostComment",
			"uses" => "PostController@delete_comment"
		]);

		Route::delete("/{post}", [
			"as"   => "DeletePost",
			"uses" => "PostController@destroy"
		]);
	});
});

//Route::group(["prefix" => "comments"], function () {
//	Route::get('/', [
//		'as'    =>  'GetComments',
//	    'uses'  =>  'CommentController@index'
//	]);
//
//	Route::get('/{comment}', [
//		'as'    =>  'GetComment',
//		'uses'  =>	'CommentController@show'
//	]);
//
//	Route::group(["before" => "auth"], function () {
//		Route::post("/{comment}/like", [
//			"as"   => "LikeUnlikeComment",
//			"uses" => "PostController@like"
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

Route::group(['prefix' => 'admin', 'before' => 'auth'], function () {
	Route::group(['prefix' => 'users'], function () {
		Route::get('/{user}/delete', [
			'as'   => 'DeleteUser',
			'uses' => 'AdminController@delete_user'
		]);

		Route::post('/{user}/promote', [
			'as'   => 'PromoteUser',
			'uses' => 'AdminController@promote'
		]);

		Route::post('/{user}/demote', [
			'as'   => 'PromoteUser',
			'uses' => 'AdminController@demote'
		]);
	});

	Route::group(['prefix' => 'posts'], function () {
		Route::get('/unapproved', [
			'as'   => 'ShowUnapprovedPosts',
		    'uses' => 'AdminController@show_unapproved'
		]);

		Route::get('/{post}/approve', [
			'as'   => 'ApprovePost',
		    'uses' => 'AdminController@approve_post'
		]);
	});

	Route::group(['prefix' => 'tags'], function () {
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

Entrust::routeNeedsRole('admin/*', ['Administrator', 'Moderator', 'Response', 'Expert'], null, false);
Entrust::routeNeedsRole('admin/posts*', 'Moderator');