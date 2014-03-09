<?php
/**
 * An Eloquent Model: 'Category'
 *
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection|\Post[] $posts
 */
class Category extends Eloquent {
	protected $table = 'categories';

	protected $hidden = ['id', 'description', 'created_at', 'updated_at'];

	/**
	 * @return \Illuminate\Database\Eloquent\Relations\HasMany
	 */
	public function posts() {
		return $this->hasMany('Post');
	}

	public function setCreatedAtAttribute() {
		$this->attributes['created_at'] = strtotime($this->created_at);
	}

	public function setUpdatedAtAttribute() {
		$this->attributes['updated_at'] = strtotime($this->updated_at);
	}

	protected function getDateFormat() {
		return 'U';
	}
}
