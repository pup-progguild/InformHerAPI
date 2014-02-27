<?php
/**
 * Created by PhpStorm.
 * User: hoshi~
 * Date: 2/26/14
 * Time: 3:33 AM
 */
App::missing(function($exception) {
	return Response::json([
		'status'        =>  'RESOURCE_NOT_FOUND',
	    'description'   =>  'HTTP 1.1/404',
	    'debug'         => $exception
	], 404);
});

//App::error(function(QueryException $exception) {
//	return Response::json([
//		'status'        =>  'DATABASE_QUERY_EXCEPTION',
//	    'description'   =>  'Resource queried might not exist in database.',
//	    'debug'         => $exception
//	], 500);
//});

