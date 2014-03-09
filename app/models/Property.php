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
 * @property string $last_modified_by
 * @property integer $properties_id
 * @property string $properties_type
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
class Property extends Eloquent {
	protected $table = 'properties';

	public $fillable = [ 'is_shown', 'is_featured' ];

	protected $softDelete = true;

	public function demprops() {
		return $this->morphTo();
	}
}
