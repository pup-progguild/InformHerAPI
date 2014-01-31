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
				'password'   => Hash::make('one'),
				'email'      => 'ichi-san@informher.com',
				'twt_handle' => 'ichi-san'
			],
			[
				'username'   => 'ni-kun',
				'password'   => Hash::make('two'),
				'email'      => 'ni-kun@informher.com',
				'twt_handle' => 'ni-kun'
			],
			[
				'username'   => 'san-kun',
				'password'   => Hash::make('three'),
				'email'      => 'san-kun@informher.com',
				'twt_handle' => 'san-kun'
			]
		);

		foreach ($users as $user) {
			User::create($user);
		}
	}
}