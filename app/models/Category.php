<?php

/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 10:57 AM
 *
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\PostCategory[] $posts
 */
class Category extends Eloquent {
	protected $table = 'categories';

	protected $hidden = array('pivot');

	/**
	 * Get the Category's posts.
	 *
	 * @return Post
	 */
	public function posts() {
		return $this->belongsToMany('Post', 'post_category', 'post_id', 'category_id');
	}
}