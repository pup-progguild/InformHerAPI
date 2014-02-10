<?php

/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 10:57 AM
 *
 */
class Category extends Eloquent {
	protected $table = 'categories';

	protected $hidden = ['id', 'description', 'created_at', 'updated_at'];

	public function posts() {
		return $this->hasMany('Post');
	}
}