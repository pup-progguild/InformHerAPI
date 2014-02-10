<?php

/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 10:19 AM
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $role_id
 */
class AssignedRole extends Eloquent {
	protected $table = 'assigned_roles';

	public $timestamps = false;
}