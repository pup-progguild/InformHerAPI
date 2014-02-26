<?php
/**
 * Created by PhpStorm.
 * User: hoshi~
 * Date: 2/26/14
 * Time: 3:33 AM
 */
App::missing(function($exception) {
	return Response::json([
		'status'    =>  'RESOURCE_NOT_FOUND'
	], 404);
});
