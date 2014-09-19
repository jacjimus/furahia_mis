<?php

/**
 * This module handles all system settings
 * @author James Makau <jacjimus@gmail.com>
 */
class SettingsModule extends CWebModule {

        public function init()
        {
                $this->setImport(array(
                    'admin.components.*',
                ));

                parent::init();
        }

        public function beforeControllerAction($controller, $action)
        {
                if (parent::beforeControllerAction($controller, $action)) {
                        return true;
                }
                else
                        return false;
        }

}
