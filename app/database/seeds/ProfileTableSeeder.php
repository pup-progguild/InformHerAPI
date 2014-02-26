<?php
/**
 * Created by PhpStorm.
 * User: hoshi~
 * Date: 2/27/14
 * Time: 12:26 AM
 */
class ProfileTableSeeder extends Seeder {
	public function run() {
		$profiles = array(
			[//1
			 'badge'             => 'The First User',
			 'twt_handle'        => 'ichi-san',
			 'facebook_username' => 'ichi-san',
			 'bio'               => 'This is the first User. Name was taken from the Japanese word for \'one\'',
			 'hompage_url'      => 'http://ichi-san.com',
			 'user_id'           => 1
			],
			[//1
			 'badge'             => 'The Second User',
			 'twt_handle'        => 'ni-kun',
			 'facebook_username' => 'ni-kun',
			 'bio'               => 'This is the second user. Name was taken from the Japanese word for \'two\'',
			 'hompage_url'      => 'http://ni-kun.com',
			 'user_id'           => 2
			],
			[//1
			 'badge'             => 'The Third User',
			 'twt_handle'        => 'san-kun',
			 'facebook_username' => 'san-kun',
			 'bio'               => 'This is the third user. Name was taken from the Japanese word for \'three\'',
			 'hompage_url'      => 'http://san-kun.com',
			 'user_id'           => 3
			],
			[//1
			 'badge'             => 'Mark Jayson',
			 'twt_handle'        => 'the_dead_poetic',
			 'facebook_username' => 'existencemodulus',
			 'bio'               => 'I\'m the one responsible for the API. It\'s hard. Don\'t try it at home.',
			 'hompage_url'      => 'http://iamexistent.wordpress.com',
			 'user_id'           => 4
			],
			[//1
			 'badge'             => 'Allan',
			 'twt_handle'        => 'temotoKun',
			 'facebook_username' => 'theoryofnekomata',
			 'bio'               => 'The front-end is his accident of a creation. In HTML5. Purely web technologies. Purely.',
			 'hompage_url'      => 'http://github.com/temoto-kun',
			 'user_id'           => 5
			],
			[//1
			 'badge'             => 'Jeremiah',
			 'twt_handle'        => 'engJEHneer',
			 'facebook_username' => 'jeremiah.tabing',
			 'bio'               => 'Actually an electronics expert - deals with PR, profitability, graphics, business rules. Really.',
			 'hompage_url'      => 'http://facebook.com/jeremiah.tabing',
			 'user_id'           => 6
			]
		);

		foreach ($profiles as $profile) {
			Profile::create($profile);
		}

	}
}
