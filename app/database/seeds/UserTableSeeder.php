<?php

/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/24/14
 * Time: 1:37 AM
 */
class UserTableSeeder extends Seeder {
	public function run() {
		$users = array(
			[
				'username'   => 'ichi-san',
				'password'   => 'one_one_one',
				'email'      => 'ichi-san@informher.com',
			],
			[
				'username'   => 'ni-kun',
				'password'   => 'two_two_two',
				'email'      => 'ni-kun@informher.com',
			],
			[
				'username'   => 'san-kun',
				'password'   => 'three_three_three',
				'email'      => 'san-kun@informher.com',
			],
		    [
			    'username'   => 'awkwardusername',
		        'password'   => 'asduff',
		        'email'      => 'markjayson.fuentes@outlook.com',
		    ],
		    [
			    'username'   => 'Temoto-kun',
			    'password'   => 'asduff',
			    'email'      => 'kiirofuriku@hotmail.com',
		    ],
		    [
			    'username'   => 'engJEHneer',
		        'password'   => 'asduff',
		        'email'      => 'tabing.jeremiah@gmail.com'
		    ]
		);

		foreach ($users as $user) {
			User::create($user);
		}
	}
}