<?php
/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 2/1/14
 * Time: 8:30 PM
 *
 * @property string $token
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property integer $user_id
 */

class AuthToken extends Eloquent {
	protected $table = 'auth_tokens';
}