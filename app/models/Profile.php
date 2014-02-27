<?php
/**
 * An Eloquent Model: 'Profile'
 *
 * @property integer $id
 * @property string $badge
 * @property string $twt_handle
 * @property string $facebook_username
 * @property string $bio
 * @property string $hompage_url
 * @property integer $user_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property-read \User $user
 */
class Profile extends Eloquent {

	public $fillable = [ 'badge', 'twt_handle', 'facebook_username', 'bio', 'hompage_url', 'user_id' ];

	protected $hidden = [ 'id' ];

	protected $appends = [ 'email_address' ];

	public function user() {
		return $this->belongsTo('User');
	}

	public function getEmailAddressAttribute() {
		return implode(array_flatten($this->user()->get(['email'])->toArray()));
	}
}
