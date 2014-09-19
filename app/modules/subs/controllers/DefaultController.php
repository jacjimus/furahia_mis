<?php

class DefaultController extends SubsModuleController {

        public function init()
        {
                $this->resource = UserResources::RES_SUBS;
                $this->resourceLabel = 'View Product';
               parent::init();
        }

        /**
         * @return array action filters
         */
        public function filters()
        {
                return array(
                    'accessControl', // perform access control for CRUD operations
                    'postOnly + delete',
                );
        }

        /**
         * Specifies the access control rules.
         * This method is used by the 'accessControl' filter.
         * @return array access control rules
         */
        public function accessRules()
        {
                return array(
                    array('allow',
                        'actions' => array('index', 'view', 'create', 'update', 'delete','schedule' , 'add' , 'logs'),
                        'users' => array('@'),
                    ),
                    array('deny', // deny all users
                        'users' => array('*'),
                    ),
                );
        }

        
       

        
        public function actionView($id)
        {       $cond = "serviceid = '$id'";
                $subs_model = Subs::model()->loadMod(array('serviceid' => $id));
                $sname = Services::model()->loadMod(array('service_id' => $id))->service_name;
                $active_subs = Subs::model()->getTotals("serviceid = '$id' AND updatetype = 1" , array(),'');
                $inactive_subs = Subs::model()->getTotals("serviceid = '$id' AND updatetype = 2" , array(),'');
                // $this->resource = Users::USER_RESOURCE_PREFIX . $user_model->user_level;
                if (!Users::isMyAccount($id))
                        $this->hasPrivilege();
                   

                $this->pageTitle = (!empty($subs_model->service_name) ? $subs_model->service_name : $sname);
                $this->showPageTitle = TRUE;

                $this->render('view', array(
                    'model' => $subs_model,
                    'active_subs' => $active_subs,
                    'sname' => $sname,
                    'inactive_subs' => $inactive_subs,
                    
                ));
        }

       

        public function actionDelete($id)
        {
                $this->hasPrivilege(Acl::ACTION_DELETE);
                Dept::model()->loadModel($id)->delete();
                if (!Yii::app()->request->isAjaxRequest)
                        $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
        }

        public function actionIndex()
        {
            $this->activeMenu = self::SUBS_MENU;   
            $this->hasPrivilege(Acl::ACTION_VIEW);
               $this->pageTitle = Lang::t(Common::pluralize($this->resourceLabel));
               $client =   (Yii::app()->user->client != 0)? "sp_client = ". (int) Yii::app()->user->client : "";
              
               $searchModel = Services::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'service_name' , $client);
               $this->render('index', array(
                    'model' => $searchModel,
                ));
        }
        public function actionLogs()
        {
                $this->activeMenu = self::MENU_SUBS_LOGS;
                $this->hasPrivilege(Acl::ACTION_VIEW);
                $this->pageTitle = Lang::t('SUBS_LOGS');
                $searchModel = new Subs();
                $subs_model_class_name = $searchModel->getClassName();
               
                
               
               $this->render('logs', array(
                    'model' => $searchModel,
                ));
        }
        public function actionSchedule()
        {
                $this->hasPrivilege(Acl::ACTION_VIEW);
                $this->pageTitle = Lang::t(Common::pluralize($this->resourceLabel));
               $client =   (Yii::app()->user->client != 0)? "sp_client = ". (int) Yii::app()->user->client : "";
              
               $searchModel = Services::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'service_name' , $client);
               $this->render('index', array(
                    'model' => $searchModel,
                ));
        }
        

}
