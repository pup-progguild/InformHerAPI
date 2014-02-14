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
				'twt_handle' => 'ichi-san'
			],
			[
				'username'   => 'ni-kun',
				'password'   => 'two_two_two',
				'email'      => 'ni-kun@informher.com',
				'twt_handle' => 'ni-kun'
			],
			[
				'username'   => 'san-kun',
				'password'   => 'three_three_three',
				'email'      => 'san-kun@informher.com',
				'twt_handle' => 'san-kun'
			],
		    [
			    'username'   => 'awkwardusername',
		        'password'   => 'asduff',
		        'email'      => 'markjayson.fuentes@outlook.com',
		        'twt_handle' => 'the_dead_poetic'
		    ],
		    [
			    'username'   => 'Temoto-kun',
			    'password'   => 'asduff',
			    'email'      => 'kiirofuriku@hotmail.com',
			    'twt_handle' => 'temotoKun'
		    ]
		);

		foreach ($users as $user) {
			User::create($user);
		}
	}
}