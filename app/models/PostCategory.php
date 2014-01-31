<?php
/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 6:48 PM
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $category_id
 */

class PostCategory extends Eloquent {
	protected $table = 'post_category';
}