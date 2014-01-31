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
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */

class CommentLike extends Eloquent {
	protected $table = 'comment_likes';
}