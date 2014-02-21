<?php
/**
 * An Eloquent Model: 'Property'
 *
 * @property integer $id
 * @property boolean $is_shown
 * @property boolean $is_featured
 * @property string $approved_by
 * @property integer $property_id
 * @property string $property_type
 */
class Property extends Eloquent {
	protected $table = 'properties';

	public $fillable = [ 'is_shown', 'is_featured' ];

	public function demprops() {
		return $this->morphTo();
	}
}