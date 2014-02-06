<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:38 AM
 *
 * @property integer $id
 * @property string $tagname
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts
 */
class Tag extends Eloquent {
	protected $hidden = array('id', 'pivot');

	public function posts() {
		return $this->belongsToMany('Post', 'post_tags');
	}
}
