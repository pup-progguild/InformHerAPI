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
	return Redirect::to('http://pup-progguild.github.io/InformHerAPI/');
});

Route::get('loaderio-b747d6b7aece34bbe0b489539900a3fa', function () {
	echo 'loaderio-b747d6b7aece34bbe0b489539900a3fa';
});

Route::get('mu-f02d10a1-3f94c9e6-13b8c9dc-55488748', function () {
	echo '42';	
});

/* InformHer API routes & endpoints */
Route::model("post", "Post");
Route::model("comment", "Comment");
Route::model("tag", "Tag");
Route::model("user", "User");

Route::group(["prefix" => "posts", "before" => "basic"], function () {
	Route::get("/", [
		"as"   => "GetAllPosts",
		"uses" => "PostController@index"
	]);

	Route::get("/{post}", [
		"as"   => "GetPost",
		"uses" => "PostController@show"
	]);

	Route::get("/{post}/comments/{id?}", [
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

	Route::post("/search", [
		"as"    => "SearchPosts",
	    "uses"  => "PostController@search"
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

Route::group(['prefix' => 'tags', 'before' => 'basic'], function () {
	Route::get('/', [
		'as'    =>  'Tags',
	    'uses'  =>  'TagController@index'
	]);
});

Route::group(['prefix' => 'category', 'before' => 'basic'], function () {
	Route::get('/', [
		'as'    =>  'Categories',
		'uses'  =>  'CategoryController@index'
	]);
});

Route::group(['before' => 'basic'], function() {
	Route::group(['prefix' => 'user'], function () {
		Route::get('/', [
			'as'    =>  'UserDetails',
			'uses'  =>  'UserController@index'
		]);

		Route::get('/posts', [
			'as'    =>  'UserPosts',
			'uses'  =>  'UserController@user_posts'
		]);

		Route::get('/comments', [
			'as'    =>  'UserComments',
			'uses'  =>  'UserController@user_comments'
		]);

		Route::post('/profile', [
			'as'    =>  'UserProfile',
			'uses'  =>  'UserController@profile'
		]);
	});
});

// Confide RESTful route
//Route::group(['before' => 'basic'], function() {        // TODO: Remove basic auth at   this!
Route::get('user/confirm/{code}', 'UserController@getConfirm');
Route::get('user/reset/{token}', 'UserController@getReset');
Route::controller( 'user', 'UserController');
//});

Route::group(['prefix' => 'admin', 'before' => 'basic'], function () {
	Route::group(['prefix' => 'users'], function () {
		Route::get('/{user}/delete', [
			'as'   => 'DeleteUser',
			'uses' => 'AdminController@delete_user'
		]); // TODO: atm, not working

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
		    'uses' => 'AdminController@show_post'
		]);

		Route::get('/{post}/hide', [
			'as'   => 'HidePost',
			'uses' => 'AdminController@hide'
		]);
	});

	Route::group(['prefix' => 'tags'], function () {
		Route::post('/{tag?}', [
			'as'   => 'AddCreateTags',
			'uses' => 'TagController@create_edit'
		]);

		Route::delete('/{tag}', [
			'as'   => 'DeleteTag',
			'uses' => 'TagController@destroy'
		]);
	});

	// FIXME: CATEGORY ADDITION AND WHATNOT NOT IMPLEMENTED
/*	Route::group(['prefix' => 'category'], function () {

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
	});*/
});

Entrust::routeNeedsRole('admin/*', ['Administrator', 'Moderator', 'Response', 'Expert'], null, false);
Entrust::routeNeedsRole('admin/posts*', 'Moderator');
Entrust::routeNeedsRole('admin/tags*', 'Moderator');

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
