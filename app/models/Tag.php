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
 */
class Tag extends Eloquent {
	protected $hidden = array('pivot');
	
	public function tagnames() {

	}
}
