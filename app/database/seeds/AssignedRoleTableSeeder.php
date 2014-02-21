<?php

/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 2/21/14
 * Time: 1:36 AM
 */
class AssignedRoleTableSeeder extends Seeder {
	public function run() {
		$assigned_roles = array(
			[
				'user_id' => 1,
				'role_id' => 1
			],
			[
				'user_id' => 2,
				'role_id' => 1
			],
			[
				'user_id' => 3,
				'role_id' => 1
			],
			[
				'user_id' => 4,
				'role_id' => 1
			],
			[
				'user_id' => 5,
				'role_id' => 1
			],
			[
				'user_id' => 6,
				'role_id' => 1
			],
			[
				'user_id' => 4,
				'role_id' => 2
			],
			[
				'user_id' => 5,
				'role_id' => 2
			],
			[
				'user_id' => 6,
				'role_id' => 2
			],
			[
				'user_id' => 4,
				'role_id' => 3
			],
			[
				'user_id' => 5,
				'role_id' => 3
			],
			[
				'user_id' => 6,
				'role_id' => 3
			],
			[
				'user_id' => 4,
				'role_id' => 4
			],
			[
				'user_id' => 5,
				'role_id' => 4
			],
			[
				'user_id' => 6,
				'role_id' => 4
			],
			[
				'user_id' => 4,
				'role_id' => 5
			],
			[
				'user_id' => 5,
				'role_id' => 5
			],
			[
				'user_id' => 6,
				'role_id' => 5
			]
		);

		foreach ($assigned_roles as $assigned_role) {
			AssignedRole::create($assigned_role);
		}

	}
}