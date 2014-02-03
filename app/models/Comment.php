<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:37 AM
 *
 * @property integer $id
 * @property string $message
 * @property integer $user_id
 * @property integer $post_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property-read \User $author
 * @property-read \Post $post
 */
class Comment extends Eloquent {

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


	/**
	 * Get the comment's author.
	 *
	 * @return User
	 */
	public function author() {
		return $this->belongsTo('User', 'user_id');
	}

	/**
	 * Get the comment's post's.
	 *
	 * @return Post
	 */
	public function post() {
		return $this->belongsTo('Post', 'post_id');
	}

}
