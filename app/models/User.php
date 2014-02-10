<?php

use Zizaco\Confide\ConfideUser;
use Zizaco\Entrust\HasRole;

/**
 * An Eloquent Model: 'User'
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $twt_handle
 * @property string $confirmation_code
 * @property boolean $confirmed
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts
 * @property-read \Illuminate\Database\Eloquent\Collection|\Comment[] $comments
 * @property-read \Illuminate\Database\Eloquent\Collection|\Role[] $roles
 * @property-read \Illuminate\Database\Eloquent\Collection|\Like[] $likes
 */
class User extends ConfideUser {

	use HasRole;

	protected $hidden = [
		'password', 'confirmation_code', 'confirmed', 'updated_at', 'created_at'
	];

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

	public function likes() {
		return $this->hasMany('Like');
	}
}