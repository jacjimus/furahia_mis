<?php

/**
 * @author James Makau <jacjimus@gmail.com>
 */
class LandratesModule extends CWebModule {

        public function init()
        {
                $this->setImport(array(
                    'admin.models.*',
                    'admin.components.*',
                ));

                parent::init();
        }

        public function beforeControllerAction($controller, $action)
        {
                if (parent::beforeControllerAction($controller, $action)) {
                        return true;
                } else
                        return false;
        }

}
