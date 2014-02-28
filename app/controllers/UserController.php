<?php

/*
|--------------------------------------------------------------------------
| Confide Controller Template
|--------------------------------------------------------------------------
|
| This is the default Confide controller template for controlling user
| authentication. Feel free to change to your needs.
|
*/

class UserController extends BaseController {

	/**
	 * Stores new account
	 *
	 */
	public function postIndex() {
		$user = new User;

		$user->username = Input::get('username');
		$user->email    = Input::get('email');
		$user->password = Input::get('password');

		// The password confirmation will be removed from model
		// before saving. This field will be used in Ardent's
		// auto validation.
		$user->password_confirmation = Input::get('password_confirmation');

		if(strcmp($user->password, $user->password_confirmation) != 0) {
			$error = 'Passwords doesn\'t match';

			return Response::json([
				'status'      => 'USER_CREATE_FAILED',
				'description' => $error
			], 200);
		}

		// Save if valid. Password field will be hashed before save
		$user->save();

		if ($user->id) {
			// Redirect with success message, You may replace "Lang::get(..." for your custom message.

			$role = DB::table('roles')->where('name', '=', 'User')->first();

			$user->roles()->attach($role->id);

			$user->profile()->save(new Profile([
				'avatar_url'    => Gravatar::src($user->email),
				'user_id'       =>  $user->id
			]));

			return Response::json([
				'status' => 'USER_CREATE_SUCCESSFUL',
				'description' => Lang::get('confide::confide.alerts.account_created')
			], 200);
		} else {
			// Get validation errors (see Ardent package)
			$error = $user->errors()->all(':message');

			return Response::json([
				'status'      => 'USER_CREATE_FAILED',
				'description' => $error
			], 200);
		}
	}

	/**
	 * Attempt to do login
	 *
	 */
	public function postLogin() {
		$input = array(
			'email' => Input::get('email'),
			'username' => Input::get('username'), // so we have to pass both
			'password' => Input::get('password'),
			'remember' => Input::get('remember'),
		);

		// If you wish to only allow login from confirmed users, call logAttempt
		// with the second parameter as true.
		// logAttempt will check if the 'email' perhaps is the username.
		// Get the value from the config file instead of changing the controller

		if (Confide::logAttempt($input, false, 'username')) {
			return Response::json([
				'status' => 'USER_LOGIN_SUCCESS',
				'user'   => Confide::user()->toArray()
			], 200);
		} else {
			$user = new User;

			// Check if there was too many login attempts
			if (Confide::isThrottled($input)) {
				$err_msg = Lang::get('confide::confide.alerts.too_many_attempts');
			} elseif ($user->checkUserExists($input) and !$user->isConfirmed($input)) {
				$err_msg = Lang::get('confide::confide.alerts.not_confirmed');
			} else {
				$err_msg = Lang::get('confide::confide.alerts.wrong_credentials');
			}

			return Response::json([
				'status' => 'USER_LOGIN_FAILED',
				'description'   => $err_msg
			], 401);
		}
	}

	/**
	 * Attempt to confirm account with code
	 *
	 * @param  string $code
	 */
	public function getConfirm($code) {
		if (Confide::confirm($code)) {
			$notice_msg = Lang::get('confide::confide.alerts.confirmation');

			return Response::json([
				'status'        =>  '_SUCCESSFUL',
				'description'   =>  $notice_msg
			], 200);
		} else {
			$error_msg = Lang::get('confide::confide.alerts.wrong_confirmation');

			return Response::json([
				'status'      => '_FAILED',
				'description' => $error_msg
			], 200);
		}
	}

	/**
	 * Attempt to send change password link to the given email
	 *
	 */
	public function postForgot() {
		if (Confide::forgotPassword(Input::get('email'))) {
			$notice_msg = Lang::get('confide::confide.alerts.password_forgot');

			return Response::json([
				'status'        =>  'USER_FORGOT_PASSWORD_EMAIL_SUCCESSFUL',
				'description'   => $notice_msg
			], 200);
		} else {
			$error_msg = Lang::get('confide::confide.alerts.wrong_password_forgot');

			return Response::json([
				'status'        =>  'USER_FORGOT_PASSWORD_EMAIL_FAILED',
				'description'   =>  $error_msg
			], 200);
		}
	}

	/**
	 * Attempt change password of the user
	 *
	 */
	public function postReset() {
		$input = array(
			'token'                 => Input::get('token'),
			'password'              => Input::get('password'),
			'password_confirmation' => Input::get('password_confirmation'),
		);

		// By passing an array with the token, password and confirmation
		if (Confide::resetPassword($input)) {
			$notice_msg = Lang::get('confide::confide.alerts.password_reset');

			return Response::json([
				'status'        =>  'USER_PASSWORD_RESET_SUCCESSFUL',
				'description'   =>  $notice_msg
			], 200);
		} else {
			$error_msg = Lang::get('confide::confide.alerts.wrong_password_reset');

			return Response::json([
				'status'      => 'USER_PASSWORD_RESET_FAILED',
				'description' => $error_msg
			], 200);
		}
	}

	/**
	 * Log the user out of the application.
	 *
	 */
	public function getLogout() {
		Confide::logout();

		return Response::json([
			'status'    =>  'USER_LOGGED_OUT_SUCCESS'
		], 200);
	}

	public function index() {
		$user = Confide::user();

		$interaction_level = [
			'total_posts'       => $user->post_count(),
			'total_comments'    => $user->comment_count(),
			'total_likes'       => $user->like_count()
		];

		$posts = [
			'ask'       => $user->posts_ask()->get()->toArray(),
			'relate'    => $user->posts_relate()->get()->toArray(),
			'shoutout'  => $user->posts_shoutout()->get()->toArray()
		];

		$comments = [
			'comments'     =>  $user->comments()->get()->toArray()
		];

		return Response::json([
			'status'    =>  'USER_HOME_RETRIEVE_SUCCESS',
			'score'     =>  $interaction_level,
			'posts'     =>  $posts,
			'comments'  =>  $comments
		], 200);
	}

	public function user_posts() {
		$user = Confide::user();

		$posts = [
			'ask'       => $user->posts_ask()->get()->toArray(),
			'relate'    => $user->posts_relate()->get()->toArray(),
			'shoutout'  => $user->posts_shoutout()->get()->toArray()
		];

		return Response::json([
			'status'    =>  'USER_POSTS_RETRIEVE_SUCCESS',
			'posts'     =>  $posts
		], 200);
	}

	public function user_comments() {
		$user = Confide::user();

		return Response::json([
			'status'    =>  'USER_COMMENTS_RETRIEVE_SUCCESS',
			'comments'     =>  $user->comments()->get()->toArray()
		], 200);
	}

	public function getProfile($id) {
		$userprofile = User::find($id);

		return Response::json([
			'status'    =>  'USER_PROFILE_FETCH_SUCESS',
			'profile'   =>  $userprofile->profile->toArray()
		]);
	}

	public function profile() {
		$user = Confide::user();

		$input = Input::all();

		$user->email = $input['email_address'];

		$user->save();

//		$profile = Profile::where('user_id', '=', $user->id);
//
//		$profile->avatar_url            = Gravatar::src($user->email);
//		$profile->badge                 = $input['badge'];
//		$profile->twt_handle            = $input['twt_handle'];
//		$profile->facebook_username     = $input['facebook_username'];
//		$profile->bio                   = $input['bio'];
//		$profile->hompage_url           = $input['hompage_url'];

		$isSuccessful = $user->profile()->save(new Profile([
			'avatar_url'        => Gravatar::src($user->email),
			'badge'             => $input['badge'],
			'twt_handle'        => $input['twt_handle'],
			'facebook_username' => $input['facebook_username'],
			'bio'               => $input['bio'],
			'hompage_url'      => $input['hompage_url'],
		]));

		if($isSuccessful) {
			return Response::json([
				'status'    => 'USER_PROFILE_UPDATE_SUCCESSFUL'
			], 200);
		} else {
			return Response::json([
				'status'    => 'USER_PROFILE_UPDATE_FAILED'
			], 200);
		}
	}
}
