<?php
/**
 * An Eloquent Model: 'Comment'
 *
 * @property integer $id
 * @property string $message
 * @property integer $user_id
 * @property integer $post_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property-read mixed $likers
 * @property-read \User $author
 * @property-read \Post $post
 */
class Comment extends Eloquent {

	protected $softDelete = true;

	protected $hidden = ['deleted_at', 'user_id', 'post_id'];

	protected $with = ['author'];

	protected $appends = ['likers'];

	/**
	 * Get the comment's content.
	 *
	 * @return string
	 */
	public function content() {
		return nl2br($this->content);
	}

	public function isTheAuthor() {
		return $this->user_id === Confide::user()->id ? true : false;
	}

	public function getLikersAttribute() {
		$like_count = $this->like_count();

		return is_null($like_count) ? 0 : $like_count;
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
		return $this->morphMany('Like', 'likeable');
	}

	public function like_count() {
		return $this->morphMany('Like', 'likeable')->count();
	}

	public function properties() {
		return $this->morphMany('Property', 'properties');
	}

	public function shown() {
		$shown_ids = Property::where('is_shown', '=', 1)->where('properties_type', '=', 'comment');

		$haha = $shown_ids->get(['properties_id']);

		$haha = array_flatten($haha->toArray());

		return Comment::whereIn('id', $haha);
	}

	public function not_shown() {
		$shown_ids = Property::where('is_shown', '=', 0)->where('properties_type', '=', 'comment');

		$haha = $shown_ids->get(['properties_id']);

		$haha = array_flatten($haha->toArray());

		return Comment::whereIn('id', $haha);
	}

	public function featured() {
		$shown_ids = Property::where('is_featured', '=', 1)->where('properties_type', '=', 'comment');

		$haha = $shown_ids->get(['properties_id']);

		$haha = array_flatten($haha->toArray());

		return Comment::whereIn('id', $haha);
	}
}
