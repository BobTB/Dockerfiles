<?php
return [
    'components' => [
        'db' => [
            'class'    => 'yii\db\Connection',
            'dsn'      => 'mysql:host=<DB_HOST>;dbname=<DB_NAME>',
            'username' => '<DB_USERNAME>',
            'password' => '<DB_PASSWORD>',
            'charset'  => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            'useFileTransport' => false,
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            // eg.
            'transport' => [
                'class'      => 'Swift_SmtpTransport',
                'host'       => '<SMTP_HOST>',
                'username'   => '<SMTP_USERNAME>',
                'password'   => '<SMTP_PASSWORD>',
                'port'       => '<SMTP_PORT>',
                'encryption' => '<SMTP_SSL>',
            ],
        ],
    ],
];

