<?php

/**
 * stores the modules configurations
 * @author James Makau <jacjimus@gmail.com>
 */
return array(
    'gii' => array(
        'class' => 'system.gii.GiiModule',
        'password' => 'root',
        'ipFilters' => array('127.0.0.1', '::1'),
    ),
    'admin',
    'reports',
    'settings',
    'users',
    'subs',
    'help',
    'msg',
    'auth',
    'bulk',
    'call',
    'hr',
   );
