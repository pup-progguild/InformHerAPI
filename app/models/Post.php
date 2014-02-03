<?php

/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/2/14
 * Time: 1:41 AM
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property string $geolocation
 * @property string $srclink
 * @property integer $user_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property-read \User $author
 * @property-read \Illuminate\Database\Eloquent\Collection|\Comment[] $comments
 * @property-read \Illuminate\Database\Eloquent\Collection|\Tag[] $tags
 * @property-read mixed $post_category
 */
class Post extends Eloquent {
	protected $softDelete = true;

	protected $appends = array(
		'post_category'//, 'author'
	);

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

	public function getPostCategoryAttribute() {
		return $this->category; //TODO: Why does this return empty, while creating another attribute, returns right result? fuck.
	}

	public function getTagsAttribute() {
		return $this->tags; //TODO: this doesn't work.
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
	 * Get the post's author.
	 *
	 * @return User
	 */
	public function author() {
		return $this->belongsTo('User', 'user_id');
	}

	/**
	 * Get the post category.
	 *
	 * @return Category
	 */
	public function category() {
		return $this->belongsToMany("Category", "post_category", "post_id", "category_id");
	}

	/**
	 * Get the post's tags.
	 *
	 * @return Tag
	 */
	public function tags() {
		return $this->belongsToMany("Tag", "post_tags", "post_id", "tag_id");
	}

	/**
	 * Get the post's comments.
	 *
	 * @return Comment
	 */
	public function comments() {
		return $this->hasMany('Comment');
	}
}
