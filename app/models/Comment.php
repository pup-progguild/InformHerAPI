<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:37 AM
 *
 */
class Comment extends Eloquent {

	protected $hidden = ['deleted_at', 'user_id', 'post_id'];

	/**
	 * Get the comment's content.
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

		return String::date($date);
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

	public function post() {
		return $this->belongsTo('Post', 'post_id');
	}

	public function likes() {
		return $this->morphMany('Like', 'imageable');
	}
}
