<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:38 AM
 *
 */
class Tag extends Eloquent {
	protected $hidden = ['id', 'created_at', 'updated_at', 'pivot'];

	public function posts() {
		return $this->belongsToMany('Post', 'post_tags');
	}
}
