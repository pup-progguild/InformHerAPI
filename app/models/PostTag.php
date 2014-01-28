<?php

/**
 * An Eloquent Model: 'PostTags'
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $tag_id
 */
class PostTags extends Eloquent {
	protected $table = 'post_tags';
}