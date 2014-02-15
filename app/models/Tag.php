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
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts
 */
class Tag extends Eloquent {
	protected $hidden = ['created_at', 'updated_at', 'pivot'];

	public function posts() {
		return $this->belongsToMany('Post', 'post_tags');
	}
}
