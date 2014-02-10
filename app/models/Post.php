<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/2/14
 * Time: 1:41 AM
 *
 */
class Post extends Eloquent {
	protected $softDelete = true;

	protected $hidden = ['category_id', 'user_id', 'deleted_at'];

	protected $with = ['category', 'tags', 'comments'];

	/**
	 * Returns a formatted post content entry,
	 * this ensures that line breaks are returned.
	 *
	 * @return string
	 */
	public function content() {
		return nl2br($this->content);
	}

	/**
	 * Get the date the post was created.
	 *
	 * @param \Carbon|null $date
	 * @return string
	 */
	public function date($date = null) {
		if (is_null($date)) {
			$date = $this->created_at;
		}

		return $date->toDateTimeString();
	}

	public function getAuthorAttribute() {
		return $this->author;   //TODO: this doesn't work.
	}

	/**
	 * Returns the date of the blog post creation,
	 * on a good and more readable format :)
	 *
	 * @return string
	 */
	public function created_at() {
		return $this->date($this->created_at);
	}

	/**
	 * Returns the date of the blog post last update,
	 * on a good and more readable format :)
	 *
	 * @return string
	 */
	public function updated_at() {
		return $this->date($this->updated_at);
	}

	public function author() {
		return $this->belongsTo('User', 'user_id');
	}

	public function category() {
		return $this->belongsTo('Category');
	}

	public function tags() {
		return $this->belongsToMany('Tag', 'post_tags', 'post_id', 'tag_id');
	}

	public function comments() {
		return $this->hasMany('Comment');
	}

	public function likes() {
		return $this->morphMany('Like', 'imageable');
	}
}
