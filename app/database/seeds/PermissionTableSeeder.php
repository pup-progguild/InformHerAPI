<?php
/**
 * Created by PhpStorm.
 * User: hoshi~
 * Date: 2/26/14
 * Time: 12:59 AM
 */ 

class PermissionTableSeeder extends Seeder {
	public function run() {
		$permissions = array(
			[ //1
				'name'          => 'auto_approved',
		        'display_name'  => 'Can post without approval'
		    ],
			[ //2
				'name'          => 'can_see_shoutout',
				'display_name'  => 'Can see shoutout posts'
			],
		    [ //3
			    'name'          => 'forbid_post',
			    'display_name'  => 'Cannot post'
		    ],
		    [ //4
			    'name'          => 'forbid_comment',
			    'display_name'  => 'Cannot comment'
		    ],
		    [ //5
			    'name'          => 'forbid_like',
			    'display_name'  => 'Cannot like posts/comments'
		    ],
		    [ //6
			    'name'          => 'banned',
			    'display_name'  => 'Cannot do anything'
		    ],
		    [
			    'name'          => 'can_manage_posts',
		        'display_name'  => 'Can manage posts'
		    ]
		);

		foreach ($permissions as $permission) {
			Permission::create($permission);
		}

	}
}
