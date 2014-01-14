<?php

class UserController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
	}

    public function login() {
        $creds = Input::only('username', 'password');

        if (Auth::attempt($creds)) {
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

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
        $user = new User;

        $user->username   = Input::get('username');
        $user->password   = Hash::make(Input::get('password'));
        $user->email      = Input::get('email');
        $user->twt_handle = Input::get('twt_handle');

        $user->save();

        return Response::make('USER_ADD_SUCCESSFUL');
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		//
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

}