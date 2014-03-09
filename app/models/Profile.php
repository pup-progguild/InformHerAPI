<?php
/**
 * An Eloquent Model: 'Profile'
 *
 * @property integer $id
 * @property string $badge
 * @property string $twt_handle
 * @property string $facebook_username
 * @property string $bio
 * @property string $hompage_url
 * @property integer $user_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \User $user
 */
class Profile extends Eloquent {

	public $fillable = [ 'badge', 'twt_handle', 'facebook_username', 'bio', 'hompage_url', 'user_id' ];

	protected $hidden = [ 'id' ];

	protected $appends = [ 'email_address', 'assigned_roles', 'username' ];

	public function user() {
		return $this->belongsTo('User');
	}

	public function getAssignedRolesAttribute() {
		return array_flatten($this->roles()->get(['name'])->toArray());
	}

	public function getEmailAddressAttribute() {
		return implode(array_flatten($this->user()->get(['email'])->toArray()));
	}

	public function getUsernameAttribute() {
		return implode(array_flatten($this->user()->get(['username'])->toArray()));
	}

	public function roles() {
		return $this->belongsToMany('Role', 'assigned_roles', 'user_id', 'role_id');
	}

	public function setCreatedAtAttribute() {
		$this->attributes['created_at'] = strtotime($this->created_at);
	}

	public function setUpdatedAtAttribute() {
		$this->attributes['updated_at'] = strtotime($this->updated_at);
	}

	protected function getDateFormat() {
		return 'U';
	}
}