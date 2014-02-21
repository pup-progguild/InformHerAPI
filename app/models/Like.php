<?php
/**
 * An Eloquent Model: 'Like'
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $likeable_id
 * @property string $likeable_type
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \User $liker
 */
class Like extends Eloquent {

	protected $with = [ 'liker' ];

	protected $fillable = [ 'user_id' ];

	protected $hidden = [ 'user_id', 'id', 'likeable_id', 'likeable_type' ];

	public function likeable() {
		return $this->morphTo();
	}

	public function liker() {
		return $this->belongsTo('User', 'user_id');
	}
}