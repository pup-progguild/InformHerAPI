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
 * @property-read mixed $is_featured
 */
class Comment extends Eloquent {

	protected $softDelete = true;

	protected $hidden = ['deleted_at', 'user_id', 'post_id'];

	protected $with = [ 'author' ];

	protected $appends = [ 'likers', 'is_featured', 'parent_post_id' ];

	/**
	 * Get the comment's content.
	 *
	 * @return string
	 */
	public function content() {
		return nl2br($this->content);
	}

	/**
	 * Checks if the currently logged in user is the owner of the post or not.
	 *
	 * @return bool
	 */
	public function isTheAuthor() {
		return $this->user_id === Confide::user()->id ? true : false;
	}

	/**
	 * Checks if post is shown or not
	 *
	 * @return bool
	 */
	public function isShown() {
		return Property::where('properties_id', '=', $this->id)->where('properties_type', '=', get_class())->where('is_shown', '=', 1)->exists();
	}

	/**
	 * Checks if post is featured or not
	 *
	 * @return bool
	 */
	public function isFeatured() {
		return Property::where('properties_id', '=', $this->id)->where('properties_type', '=', get_class())->where('is_featured', '=', 1)->exists();
	}

	public function getParentPostIdAttribute() {
		return $this->post_id;
	}

	/**
	 * Get likers attribute
	 *
	 * @return int
	 */
	public function getLikersAttribute() {
		$like_count = $this->like_count();

		return is_null($like_count) ? 0 : $like_count;
	}

	/**
	 * Get is_featured attribute
	 *
	 * @return bool
	 */
	public function getIsFeaturedAttribute() {
		return (bool) $this->isFeatured();
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
	 * The author of this Comment
	 *
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function author() {
		return $this->belongsTo('User', 'user_id');
	}

	/**
	 * The parent Post this Comment belongs to
	 *
	 * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
	 */
	public function post() {
		return $this->belongsTo('Post', 'post_id');
	}

	/**
	 * Relation on Likes as Polymorphic
	 *
	 * @return \Illuminate\Database\Eloquent\Relations\MorphMany
	 */
	public function likes() {
		return $this->morphMany('Like', 'likeable');
	}

	/**
	 * Count likes for specified Comment
	 *
	 * @return int
	 */
	public function like_count() {
		return $this->morphMany('Like', 'likeable')->count();
	}

	/**
	 * Relation on Properties as Many-to-Many
	 *
	 * @return \Illuminate\Database\Eloquent\Relations\MorphMany
	 */
	public function properties() {
		return $this->morphMany('Property', 'properties');
	}

	/**
	 * Show shown comments
	 *
	 * @return \Illuminate\Database\Query\Builder|static
	 */
	public function shown() {
		$shown_ids = Property::where('is_shown', '=', 1)->where('properties_type', '=', get_class());

		$shown_a = array_flatten($shown_ids->get(['properties_id'])->toArray());

		return (count($shown_a) != 0) ? $this::whereIn('id', $shown_a) : null;
	}

	/**
	 * Show not shown posts
	 *
	 * @return \Illuminate\Database\Query\Builder|static
	 */
	public function not_shown() {
		$not_shown_ids = Property::where('is_shown', '=', 0)->where('properties_type', '=', get_class());

		$not_shown_a = array_flatten($not_shown_ids->get(['properties_id'])->toArray());

		return (count($not_shown_a) != 0) ? $this::whereIn('id', $not_shown_a) : null;
	}

	/**
	 * Show featured comments
	 *
	 * @return \Illuminate\Database\Query\Builder|static
	 */
	public function featured() {
		$featured_ids = Property::where('is_featured', '=', 1)->where('properties_type', '=', get_class());

		$featured_a = array_flatten($featured_ids->get(['properties_id'])->toArray());

		return (count($featured_a) != 0) ? $this::whereIn('id', $featured_a) : null;
	}
}
