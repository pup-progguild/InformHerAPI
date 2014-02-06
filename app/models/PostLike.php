<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:39 AM
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $user_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
class PostLike extends Eloquent {
	protected $table = 'post_likes';

	public $timestamps = false;
}
