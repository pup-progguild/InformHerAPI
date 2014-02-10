<?php
/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 2/11/14
 * Time: 3:07 AM
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $imageable_id
 * @property string $imageable_type
 */

class Like extends Eloquent {

	protected $with = [ 'likers' ];

	protected $hidden = ['user_id','id', 'imageable_id', 'imageable_type'];

	public function imageable() {
		return $this->morphTo();
	}

	public function likers() {
		return $this->belongsTo('User', 'user_id');
	}
}