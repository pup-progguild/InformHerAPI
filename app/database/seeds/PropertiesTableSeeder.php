<?php

/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 2/21/14
 * Time: 5:49 AM
 */
class PropertiesTableSeeder extends Seeder {
	public function run() {
		$properties = array(
			[
				'is_shown'        => 1,
				'is_featured'     => 1,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 1,
				'properties_type' => 'post'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 2,
				'properties_type' => 'post'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 3,
				'properties_type' => 'post'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 1,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 4,
				'properties_type' => 'post'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 5,
				'properties_type' => 'post'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 1,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 2,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 3,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 4,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 5,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 6,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 1,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 7,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 8,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 9,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 10,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 1,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 11,
				'properties_type' => 'comment'
			],
			[
				'is_shown'        => 1,
				'is_featured'     => 0,
				'approved_by'     => 'awkwardusername',
				'properties_id'   => 12,
				'properties_type' => 'comment'
			]
		);


		foreach ($properties as $property) {
			Property::create($property);
		}
	}
}