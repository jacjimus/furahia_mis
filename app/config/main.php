<?php

/**
 * stores all the site-wide configurations
 * @author James Makau <jacjimus@gmail.com>
 * @version 1.0
 */
// Yii::setPathOfAlias('local','path/to/local-folder');
return array(
    'basePath' => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name' => 'Furahia Mobile MIS Portal',
    'theme' => 'default',
    'language' => 'en',
    // preloading 'log' component
    'preload' => array('log'),
    // autoloading model and component classes
    'import' => require(dirname(__FILE__) . '/import.php'),
    //available modules
    'modules' => require(dirname(__FILE__) . '/modules.php'),
    'defaultController' => 'default',
    // application components
    'components' => array(
        'clientScript' => array(
            'class' => 'CClientScript',
            'scriptMap' => array(
                'jquery.js' => false,
                'jquery.min.js' => false,
            ),
            'coreScriptPosition' => CClientScript::POS_END,
        ),
        'cache' => array(
            'class' => 'system.caching.CFileCache',
            'enabled' => TRUE,
        ),
        'settings' => array(
            'class' => 'CmsSettings',
            'cacheComponentId' => 'cache',
            'cacheId' => 'global_website_settings',
            'cacheTime' => 84000,
            'tableName' => '{{settings}}',
            'dbComponentId' => 'db',
            'createTable' => false,
            'dbEngine' => 'InnoDB',
        ),
        'user' => array(
            // enable cookie-based authentication
            'allowAutoLogin' => true,
            'loginUrl' => array('auth/default/login'),
            'autoRenewCookie' => false,
            'authTimeout' => 31557600,
        ),
        'urlManager' => array(
            'class' => 'UrlManager',
            'urlFormat' => 'path',
            'showScriptName' => false,
            'caseSensitive' => true,
            'urlSuffix' => '',
            'rules' => array(
                '<controller:[\w\-]+>/<action:[\w\-]+>' => '<controller>/<action>',
            /* '<controller:\w+>/<action:\w+>'=>'<controller>/<action>', */
            ),
        ),
        //database settings
        'db' => require(dirname(__FILE__) . '/db.php'),
        'errorHandler' => array(
         // use 'error/index' action to display errors
         'errorAction' => 'error/index',
        ),
        'log' => array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => YII_DEBUG ? 'error, warning, info' : 'error, warning',
                ),
                array(
                    'class' => 'CWebLogRoute',
                    'enabled' => FALSE,
                ),
            ),
        ),
        'session' => array(
            'class' => 'CCacheHttpSession',
        ),
        'request' => array(
            'enableCsrfValidation' => false,
        ),
        'easyImage' => array(
            'class' => 'application.extensions.easyimage.EasyImage',
            'driver' => 'GD',
            'quality' => 100,
            'cachePath' => '/assets/easyimage/',
            'cacheTime' => 2592000,
            'retinaSupport' => false,
        ),
        'localtime' => array(
            'class' => 'application.modules.settings.components.LocalTime',
        ),
        'mailer' => require(dirname(__FILE__) . '/email.php'),
        'fusioncharts' => array(
                    'class' => 'ext.fusioncharts.fusionCharts',
            ),
    ),
    // application-level parameters that can be accessed
    // using Yii::app()->params['paramName']
    'params' => require(dirname(__FILE__) . '/params.php'),
);
