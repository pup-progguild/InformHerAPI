<?php
/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 2:48 PM
 *
 * @property integer $id
 * @property integer $comment_id
 * @property integer $user_id
 */

class CommentLike extends Eloquent {
	protected $table = 'comment_likes';
}