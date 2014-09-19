<?php


class DefaultController extends BulkModuleController {

        public function init()
        {
                $this->resource = UserResources::RES_BULK;
                $this->activeMenu = self::MENU_BULK;
                $this->resourceLabel = 'Bulk Sms';
                $this->resourceBulkLabel = 'Bulk Sms Template';
                $this->resourceAddLabel = 'Manage Bulk Smses';
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
                        'actions' => array('index', 'view', 'create', 'send', 'update', 'delete','template' , 'add'),
                        'users' => array('@'),
                    ),
                    array('deny', // deny all users
                        'users' => array('*'),
                    ),
                );
        }

         public function actionCreate()
        {
                $this->hasPrivilege(Acl::ACTION_CREATE);

                $this->pageTitle = Lang::t('Add ' . $this->resourceBulkLabel);

                $model = new BulkTemplate;
                $model_class_name = $model->getClassName();

                if (isset($_POST[$model_class_name])) {
                        $model->attributes = $_POST[$model_class_name];
                        if ($model->save()) {
                                Yii::app()->user->setFlash('success', Lang::t('SUCCESS_MESSAGE'));
                                $this->redirect(array('template'));
                        }
                }

                $this->render('create', array(
                    'model' => $model,
                ));
        }
        public function actionTemplate()
        {
               $this->hasPrivilege(Acl::ACTION_VIEW);
               $this->activeMenu = self::MENU_BULK_TEMPLATE;
                $this->pageTitle = Lang::t('Manage ' . $this->resourceBulkLabel);
                $client =   (Yii::app()->user->client != 0)? "client_id = ". (int) Yii::app()->user->client : "";
                $this->render('template', array(
                    'model' => BulkTemplate::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'id' , $client),
                ));
        }
        
        public function actionSend()
        {
               $this->hasPrivilege(Acl::ACTION_VIEW);
               $this->activeMenu = self::MENU_BULK_TEMPLATE;
                $this->pageTitle = Lang::t('Manage ' . $this->resourceBulkLabel);
                $client =   (Yii::app()->user->client != 0)? "client_id = ". (int) Yii::app()->user->client : "";
                $this->render('template', array(
                    'model' => BulkTemplate::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'id' , $client),
                ));
        }
       /**
         * Updates a particular model.
         * If update is successful, the browser will be redirected to the 'view' page.
         * @param integer $id the ID of the model to be updated
         */
        public function actionUpdate($id)
        {
                $this->hasPrivilege(Acl::ACTION_UPDATE);

                $this->pageTitle = Lang::t('Edit ' . $this->resourceLabel);


                $model = BulkTemplate::model()->loadModel($id);
                $model_class_name = $model->getClassName();

                if (isset($_POST[$model_class_name])) {
                        $model->attributes = $_POST[$model_class_name];
                        if ($model->save()) {
                                Yii::app()->user->setFlash('success', Lang::t('SUCCESS_MESSAGE'));
                                $this->redirect(array('template'));
                        }
                }

                $this->render('update', array(
                    'model' => $model,
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
                $this->hasPrivilege(Acl::ACTION_VIEW);
                $this->pageTitle = Lang::t(Common::pluralize($this->resourceAddLabel));
                

                $searchModel = Staff::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], '');
                $this->render('index', array(
                    'model' => $searchModel,
                ));
        }
        
}
