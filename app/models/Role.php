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
	public static $rules = array(
		'name' => 'required|between:4,255'
	);
}
