<?php

class RoleTableSeeder extends Seeder {
	public function run() {
		$roles = array(
			[
				'name'        => 'User',
				'description' => 'Ordinary User'
			],
			[
				'name'        => 'Expert',
				'description' => 'Able to post in #Relate'
			],
		    [
			    'name'        => 'Response',
			    'description' => 'Able to see posts in #Shoutout'
		    ],
		    [
			    'name'        => 'Moderator',
			    'description' => 'Can approve of posts in #Ask.'
		    ],
		    [
			    'name'        => 'Administrator',
			    'description' => 'The administrator who can do everything.'
		    ]
		);

		foreach ($roles as $role) {
			Role::create($role);
		}

	}	
}