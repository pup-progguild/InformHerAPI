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
 */
class PostLike extends Eloquent {
	protected $table = 'post_likes';
}
