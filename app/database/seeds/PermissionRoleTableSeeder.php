<?php
/**
 * Created by PhpStorm.
 * User: hoshi~
 * Date: 2/26/14
 * Time: 1:15 AM
 */ 
class PermissionRoleTableSeeder extends Seeder {
	public function run() {
		$permission_roles = array(
			[
				'permission_id' =>  2, //canseeshoutout
			    'role_id'       =>  3 //response
		    ],
			[
				'permission_id' =>  1,
				'role_id'       =>  2
			]
		);

		foreach ($permission_roles as $permission_role) {
			PermissionRole::create($permission_role);
		}

	}
}
