<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 2/11/14
 * Time: 3:07 AM
 */

class Like extends Eloquent {
	public function imageable() {
		return $this->morphTo();
	}

	public function likers() {
		$this->belongsTo('User');
	}
}