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
 * @property-read mixed $is_featured
 */
class Post extends Eloquent {
	protected $softDelete = true;

	protected $hidden = [ 'category_id', 'user_id', 'deleted_at' ];

	protected $with = [ 'tags', 'author', 'category' ];

	protected $appends = [ 'likers' , 'is_featured' , 'comments_count' ];

	/**
	 * Returns a formatted post content entry,
	 * this ensures that line breaks are returned.
	 *
	 * @return string
	 */
	public function content() {
		return nl2br($this->content);
	}

//	public function setContentAttribute() {
//		$this->attributes['content'] = $this->content();
//	}

	public function isTheAuthor() {
        return $this->user_id === Confide::user()->id ? true : false;
    }

	public function isShown() {
		return Property::where('properties_id', '=', $this->id)->where('properties_type', '=', 'post')->where('is_shown', '=', 1)->exists();
	}

	public function isFeatured() {
		return Property::where('properties_id', '=', $this->id)->where('properties_type', '=', 'post')->where('is_featured', '=', 1)->exists();
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

	public function getIsFeaturedAttribute() {
		return $this->isFeatured();
	}

	public function getCommentsCountAttribute() {
		return $this->comments_count();
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

	public function comments_count() {
		return $this->hasMany('Comment')->count();
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

	public function ask() {
		return $this::whereHas('Category', function ($q) {
			$q->where('name', '=', 'ask');
		});
	}

	public function relate() {
		return $this::whereHas('Category', function ($q) {
			$q->where('name', '=', 'relate');
		});
	}

	public function shoutout() {
		return $this::whereHas('Category', function ($q) {
			$q->where('name', '=', 'shoutout');
		});
	}

	/**
	 * Show shown post
	 *
	 * @return \Illuminate\Database\Query\Builder|null|static
	 */
	public function shown() {
		$shown_ids = Property::where('is_shown', '=', 1)->where('properties_type', '=', 'post')->lists('properties_id');

		return (count($shown_ids) != 0) ? $this::whereIn('id', $shown_ids)->whereNull('deleted_at') : null;
	}

	/**
	 * Show not shown posts
	 *
	 * @return \Illuminate\Database\Query\Builder|null|static
	 */
	public function not_shown() {
		$not_shown_ids = Property::where('is_shown', '=', 0)->where('properties_type', '=', 'post')->lists('properties_id');

		return (count($not_shown_ids) != 0) ? $this::whereIn('id', $not_shown_ids)->whereNull('deleted_at') : null;
	}

	/**
	 * Show EE. Except ShoutOut posts
	 *
	 * @return \Illuminate\Database\Eloquent\Builder|null|static
	 */
	public function everything_else() {
		$everything_else = Property::where('is_shown', '=', 1)->where('properties_type', '=', 'post')->lists('properties_id');

		return (count($everything_else) != 0) ? $this::whereIn('id', $everything_else)->whereHas('Category', function($q) {
				$q->where('name', '!=', 'shoutout');})->whereNull('deleted_at') : null;
	}

	/**
	 * Show featured posts
	 *
	 * @return \Illuminate\Database\Query\Builder|null|static
	 */
	public function featured() {
		$featured_ids = Property::where('is_featured', '=', 1)->where('properties_type', '=', 'post')->lists('properties_id');

		return (count($featured_ids) != 0) ? $this::whereIn('id', $featured_ids)->whereNull('deleted_at') : null;
	}
}
