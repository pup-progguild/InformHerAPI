<?php

return array(

	/*
	|--------------------------------------------------------------------------
	| oAuth Config
	|--------------------------------------------------------------------------
	*/

	/**
	 * Storage
	 */
	'storage'   => 'Session',

	/**
	 * Consumers
	 */
	'consumers' => array(

		/**
		 * Facebook
		 */
		'Facebook' => array(
			'client_id'     => '',
			'client_secret' => '',
			'scope'         => array(),
		),

		'Twitter'  => array(
			'client_id'     => 'lABKtt4af3LCc8OL22BYDA',
			'client_secret' => 'kNM7ZycDy57NQyv9sroEvrJG6zSbVcqTuEWIoEMfcQ',
		),

	)

);