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
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \User $liker
 */

class Like extends Eloquent {

	protected $with = [ 'liker' ];

	protected $hidden = ['user_id','id', 'imageable_id', 'imageable_type'];

	public function imageable() {
		return $this->morphTo();
	}

	public function liker() {
		return $this->belongsTo('User', 'user_id');
	}
}