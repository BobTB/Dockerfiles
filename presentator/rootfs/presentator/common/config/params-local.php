<?php
return [
    // app domain/vhost
    'publicUrl' => '<PUBLIC_URL>',

    // !!! insert a secret key in the following (if it is empty) - this is required for User validation
    'activationSalt'   => '<SALT>',

    // !!! insert a secret key in the following (if it is empty) - this is required for API User authentication
    'apiUserSecretKey' => '<API_SALT>',

    // facebook login app data
    'facebookAuth' => [
        'clientId'     => '',
        'clientSecret' => '',
    ],

    // recaptcha keys (prevent login brute force attacks)
    'recaptcha' => [
        'siteKey'   => '<RECAPTCHA_KEY>',
        'secretKey' => '<RECAPTCHA_SECRET>',
    ],

    // service email address
    'noreplyEmail' => '<NOREPLY_MAIL>',
    'supportEmail' => '<SUPPORT_MAIL>',
];

