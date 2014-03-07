<?php

/**
 * An Eloquent Model: 'AssignedRole'
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $role_id
 */
class AssignedRole extends Eloquent {
	protected $table = 'assigned_roles';

	protected $hidden = [ 'pivot' ];

	public $timestamps = false;
}