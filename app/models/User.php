<?php

use Zizaco\Confide\ConfideUser;
use Zizaco\Entrust\HasRole;

class User extends ConfideUser {

	use HasRole;

	public static $rules = array(
		'username' => 'unique:users,username',
		'email'    => 'email'
	);

	public function posts() {
		return $this->hasMany('Post');
	}

	public function comments() {
		return $this->hasMany('Comment');
	}

	public function roles() {
		return $this->hasMany('Role');
	}
}