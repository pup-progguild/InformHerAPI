<?php
/**
 * Created by PhpStorm.
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:46 AM
 */ 
class UsersController extends BaseController {
	public function login() {
		$creds = Input::only('username', 'password');

		if(Auth::attempt($creds)) {
			return Redirect::intended('/');
		}

		return Redirect::to('UsersController@login');
	}

	public function logout() {
		Auth::logout();

		return Response::make('USER_LOGOUT_SUCCESSFUL');
	}

	public function updateProfile() {

	}

	public function add() {
		$user = new User;

		$user->username = Input::get('username');
		$user->password = Hash::make(Input::get('password'));
		$user->email = Input::get('email');
		$user->twt_handle = Input::get('twt_handle');

		$user->save();

		return Response::make('USER_ADD_SUCCESSFUL');
	}

	public function update() {

	}

	public function delete() {

	}
}
