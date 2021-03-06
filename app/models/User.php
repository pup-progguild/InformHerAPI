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
 * @property string $confirmation_code
 * @property boolean $confirmed
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts
 * @property-read \Illuminate\Database\Eloquent\Collection|\Comment[] $comments
 * @property-read \Illuminate\Database\Eloquent\Collection|\Like[] $likes
 * @property-read \Illuminate\Database\Eloquent\Collection|\Like[] $like_count
 * @property-read \Profile $profile
 * @property-read \Illuminate\Database\Eloquent\Collection|\Role[] $roles
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts_ask
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts_relate
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts_shoutout
 */
class User extends ConfideUser {

	use HasRole;

	protected $hidden = [
		'password', 'confirmation_code', 'confirmed', 'updated_at', 'created_at'
	];

	protected $with = [
		'profile'
	];

	public static $rules = array(
		'username' => 'unique:users,username',
		'email'    => 'email'
	);

	public function posts() {
		return $this->hasMany('Post')->orderBy('created_at', 'desc');
	}

	public function posts_ask() {
		return $this->hasMany('Post')->whereHas('Category', function ($q) {
			$q->where('name', '=', 'ask');
		})->orderBy('created_at', 'desc');
	}

	public function posts_relate() {
		return $this->hasMany('Post')->whereHas('Category', function ($q) {
			$q->where('name', '=', 'relate');
		})->orderBy('created_at', 'desc');
	}

	public function posts_shoutout() {
		return $this->hasMany('Post')->whereHas('Category', function ($q) {
			$q->where('name', '=', 'shoutout');
		})->orderBy('created_at', 'desc');
	}

	public function comments() {
		return $this->hasMany('Comment')->orderBy('created_at', 'desc');
	}

	public function likes() {
		return $this->hasMany('Like')->orderBy('created_at', 'desc');
	}

	public function post_count() {
		return $this->posts()->count();
	}

	public function comment_count() {
		return $this->comments()->count();
	}

	public function like_count() {
		return $this->hasMany('Like')->count();
	}

	public function profile() {
		return $this->hasOne('Profile');
	}
}
