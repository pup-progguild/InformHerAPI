<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/2/14
 * Time: 1:41 AM
 *
 * @property integer $id
 * @property string $type
 * @property string $title
 * @property string $content
 * @property integer $user_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property string $geolocation
 * @property string $srclink
 */
class Post extends Eloquent {
	// protected $softDelete = true;
}
