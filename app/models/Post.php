<?php
/**
 * An Eloquent Model: 'Post'
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property string $geolocation
 * @property string $srclink
 * @property integer $user_id
 * @property integer $category_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property-read int $likers
 * @property-read \User $author
 * @property-read \Category $category
 * @property-read \Illuminate\Database\Eloquent\Collection|\Tag[] $tags
 * @property-read \Illuminate\Database\Eloquent\Collection|\Comment[] $comments
 */
class Post extends Eloquent {
	protected $softDelete = true;

	protected $hidden = [ 'category_id', 'user_id', 'deleted_at' ];

	protected $with = [ 'tags', 'comments', 'author', 'category' ];

	protected $appends = [ 'likers' ];

	/**
	 * Returns a formatted post content entry,
	 * this ensures that line breaks are returned.
	 *
	 * @return string
	 */
	public function content() {
		return nl2br($this->content);
	}

	public function isTheAuthor() {
        return $this->user_id === Confide::user()->id ? true : false;
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

	public function getLikersAttribute() {
		$like_count = $this->like_count();

		return is_null($like_count) ? 0 : $like_count;
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
		return $this->hasMany('Comment')->orderBy('created_at', 'desc');
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
		$shown_ids = Property::where('is_shown', '=', 1)->where('properties_type', '=', 'post');

		$haha = $shown_ids->get(['properties_id']);

		$haha = array_flatten($haha->toArray());

		if (count($haha) != 0)
			return Post::whereIn('id', $haha);

		return null;
	}

	public function not_shown() {
		$shown_ids = Property::where('is_shown', '=', 0)->where('properties_type', '=', 'post');

		$haha = $shown_ids->get(['properties_id']);

		$haha = array_flatten($haha->toArray());

		if(count($haha) != 0)
			return Post::whereIn('id', $haha);

		return null;
	}

	public function featured() {
		$shown_ids = Property::where('is_featured', '=', 1)->where('properties_type', '=', 'post');

		$haha = $shown_ids->get(['properties_id']);

		$haha = array_flatten($haha->toArray());

		if (count($haha) != 0)
			return Post::whereIn('id', $haha);

		return null;
	}
}
