<?php

/**
 * stores the database configurations
 * @author James Makau <jacjimus@gmail.com>
 */

return array(
    'connectionString' => 'mysql:host=192.168.1.229;port=3306;dbname=partnerdb',
    'emulatePrepare' => true,
    'username' => 'conn',
    'password' => '4dm1n2014',
    'schemaCachingDuration' => 600,
    'tablePrefix' => '',
    'enableParamLogging' => false,
    'enableProfiling' => false,
    'charset' => 'utf8',
    'nullConversion' => PDO::NULL_EMPTY_STRING,
    'initSQLs' => array("set time_zone='+03:00';"),
);

