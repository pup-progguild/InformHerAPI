<?php

use Zizaco\Entrust\EntrustRole;

/**
 * An Eloquent Model: 'Role'
 *
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\User[] $users
 * @property-read \Illuminate\Database\Eloquent\Collection|\Permission[] $perms
 * @property mixed $permissions
 */
class Role extends EntrustRole {
	protected $hidden = [ 'pivot' ];

	public static $rules = array(
		'name' => 'required|between:4,255'
	);

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
