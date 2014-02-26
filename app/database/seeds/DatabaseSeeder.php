<?php

class DatabaseSeeder extends Seeder {

	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run() {
		Eloquent::unguard();

		$this->call('UserTableSeeder');

		$this->call('CategoryTableSeeder');
		$this->call('TagTableSeeder');

		$this->call('PostTableSeeder');

		$this->call('PostTagTableSeeder');

		$this->call('CommentsTableSeeder');

		$this->call('LikeTableSeeder');

		$this->call('RoleTableSeeder');

		$this->call('AssignedRoleTableSeeder');

//		$this->call('PermissionTableSeeder');

//      $this->call('PermissionRoleTableSeeder');

		$this->call('ProfileTableSeeder');

		$this->call('PropertiesTableSeeder');
	}
}
