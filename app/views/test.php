<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 8:48 AM
 */

use Carbon\Carbon;

$session = Auth::getSession();

echo $session->getId();

Cache::put('hello', 'world', Carbon::create(null,null,null,1));

