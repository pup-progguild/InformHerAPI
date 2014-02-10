<?php

/**
 * An Eloquent Model: 'PostTag'
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $tag_id
 */
class PostTag extends Eloquent {
	protected $table = 'post_tags';

	public $timestamps = false;
}