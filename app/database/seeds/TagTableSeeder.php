<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 3:11 PM
 */

class TagTableSeeder extends Seeder {
	public function run() {
		$tags = array(
			[
				'tagname'  =>  'education'
			],
		    [
			    'tagname'  =>   'health'
		    ],
		    [
			    'tagname'   =>  'abuse'
		    ],
		    [
			    'tagname'   =>  'government'
		    ],
		    [
			    'tagname'   =>  'news'
		    ],
		    [
			    'tagname'   =>  'InformHer: Bug'
		    ]
		);

		foreach ($tags as $tag) {
			Tag::create($tag);
		}
	}
}