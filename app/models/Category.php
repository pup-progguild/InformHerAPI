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
 */
class Category extends Eloquent {
	protected $table = 'categories';
}