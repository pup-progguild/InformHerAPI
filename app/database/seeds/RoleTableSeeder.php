<?php

class RoleTableSeeder extends Seeder {
	public function run() {
		$roles = array(
			[ //1
				'name'        => 'User',
				'description' => 'Ordinary User'
			],
			[ //2
				'name'        => 'Expert',
				'description' => 'Able to post in #Relate'
			],
		    [ //3
			    'name'        => 'Response',
			    'description' => 'Able to see posts in #Shoutout'
		    ],
		    [ //4
			    'name'        => 'Moderator',
			    'description' => 'Can approve of posts in #Ask.'
		    ],
		    [ //5
			    'name'        => 'Administrator',
			    'description' => 'The administrator who can do everything.'
		    ],
		    [ //6
			    'name'        => 'Banned',
		        'description' => 'Banned'
		    ]
		);

		foreach ($roles as $role) {
			Role::create($role);
		}

	}	
}
