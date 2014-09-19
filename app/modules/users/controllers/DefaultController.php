<?php

/**
 * The user/staff controller
 * @author James Makau <jacjimus@gmail.com>
 */
class DefaultController extends UsersModuleController {

        const LOG_ACTIVITY = 'activity_log';
        const LOG_LOGIN = 'login_log';

        /**
         * Executed before every action
         */
        public function init()
        {
                $this->resource = UserResources::RES_USER_ADMIN;
                $this->resourceLabel = 'User';
                $this->activeMenu = self::MENU_USER_ADMIN;

                parent::init();
        }

        /**
         * @return array action filters
         */
        public function filters()
        {
                return array(
                    'accessControl', // perform access control for CRUD operations
                    'postOnly + delete,changeStatus,changeLevel,deleteLog', // we only allow deletion via POST request
                    'ajaxOnly + resetPassword,loginLog,activityLog',
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
                        'actions' => array('index', 'view', 'create', 'delete', 'changeStatus', 'changeLevel', 'deleteLog', 'loginLog', 'activityLog'),
                        'users' => array('@'),
                    ),
                    array('deny', // deny all users
                        'users' => array('*'),
                    ),
                );
        }

        /**
         * Displays a particular model.
         * @param integer $id the ID of the model to be displayed
         */
        public function actionView($id = NULL, $action = NULL)
        {
                if (NULL === $id)
                        $id = Yii::app()->user->id;
                $user_model = Users::model()->loadModel($id);
                $person_model = Person::model()->loadModel($id);

                $this->resource = Users::USER_RESOURCE_PREFIX . $user_model->user_level;
                
                if (!Users::isMyAccount($id))
                        $this->hasPrivilege();

                $this->pageTitle = $person_model->name;
                $this->showPageTitle = TRUE;

                $address_model = PersonAddress::model()->find('`person_id`=:t1', array(':t1' => $id));
                if (NULL === $address_model) {
                        $address_model = new PersonAddress();
                        $address_model->person_id = $id;
                }

                if (!empty($action)) {
                        if (!Users::isMyAccount($id)) {
                                $this->checkPrivilege($user_model, Acl::ACTION_UPDATE);
                        }
                        switch ($action) {
                                case Users::ACTION_UPDATE_PERSONAL:
                                        $this->update($person_model);
                                        break;
                                case Users::ACTION_UPDATE_ACCOUNT:
                                        $this->update($user_model);
                                        break;
                                case Users::ACTION_UPDATE_ADDRESS:
                                        $this->update($address_model);
                                        break;
                                case Users::ACTION_RESET_PASSWORD:
                                        $this->resetPassword($user_model);
                                        break;
                                case Users::ACTION_CHANGE_PASSWORD:
                                        $this->changePassword($user_model);
                                        break;
                                default :
                                        $action = NULL;
                        }
                }

                $this->render('view', array(
                    'user_model' => $user_model,
                    'person_model' => $person_model,
                    'address_model' => $address_model,
                    'action' => $action
                ));
        }

        /**
         * Creates a new model.
         * If creation is successful, the browser will be redirected to the 'view' page.
         */
        public function actionCreate($dept_id = NULL, $user_level = NULL)
        {
                $this->hasPrivilege(Acl::ACTION_CREATE);
                $this->pageTitle = Lang::t('Add ' . $this->resourceLabel);

                //account information
                $user_model = new Users(ActiveRecord::SCENARIO_CREATE);
                $user_model->status = Users::STATUS_ACTIVE;
                $user_model_class_name = $user_model->getClassName();
                //personal information
                $person_model = new Person();
                $person_model_class_name = $person_model->getClassName();

                if (Yii::app()->request->isPostRequest) {
                        $user_model->attributes = $_POST[$user_model_class_name];
                        $person_model->attributes = $_POST[$person_model_class_name];
                        
                        $user_model->validate();
                        $person_model->validate();

                        if (!$user_model->hasErrors() && !$person_model->hasErrors()) {
                                if ($user_model->save(FALSE)) {
                                        $person_model->id = $user_model->id;
                                        $person_model->save(FALSE);
                                        $user_model->updateDeptUser();
                                        if (!empty($user_model->dept_id))
                                                Dept::model()->updateContactPerson($user_model->dept_id, $person_model->id);
                                        Yii::app()->user->setFlash('success', Lang::t('SUCCESS_MESSAGE'));
                                        $this->redirect(Controller::getReturnUrl($this->createUrl('view', array('id' => $user_model->id))));
                                }
                        }
                }

                $user_model->timezone = Yii::app()->settings->get(Constants::CATEGORY_GENERAL, Constants::KEY_DEFAULT_TIMEZONE, SettingsTimezone::DEFAULT_TIME_ZONE);
                if (!empty($dept_id)) {
                        $user_model->dept_id = $dept_id;
                }
                if (!empty($user_level)) {
                        $user_model->user_level = $user_level;
                }
                $this->render('create', array(
                    'user_model' => $user_model,
                    'person_model' => $person_model,
                ));
        }

        
        /**
         * Update user records
         * @param type $model
         */
        protected function update($model)
        {
                $model_class_name = $model->getClassName();

                if (isset($_POST[$model_class_name])) {
                        $model->attributes = $_POST[$model_class_name];
                        if ($model->save()) {
                                Yii::app()->user->setFlash('success', Lang::t('SUCCESS_MESSAGE'));
                                $this->refresh();
                        }
                }
        }

        protected function resetPassword($model)
        {
                $model->setScenario(Users::SCENARIO_RESET_PASSWORD);
                $model->password = NULL;
                $model_class_name = $model->getClassName();

                if (isset($_POST[$model_class_name])) {
                        $model->attributes = $_POST[$model_class_name];
                        if ($model->save()) {
                                Yii::app()->user->setFlash('success', Lang::t('SUCCESS_MESSAGE'));
                                $this->refresh();
                        }
                }
        }

        protected function changePassword($model)
        {
                if (!Users::isMyAccount($model->id))
                        throw new CHttpException(403, Lang::t('403_error'));

                $model->setScenario(Users::SCENARIO_CHANGE_PASSWORD);
                $model->pass = $model->password;
                $model->password = null;
                $model_class_name = $model->getClassName();

                if (isset($_POST[$model_class_name])) {
                        $model->attributes = $_POST[$model_class_name];
                        $currentPass = $model->currentPassword;
                        if ($model->save()) {
                                Yii::app()->user->setFlash('success', Lang::t('SUCCESS_MESSAGE'));
                                $this->refresh();
                        }

                        $model->currentPassword = $currentPass;
                }
        }

        /**
         * Deletes a particular model.
         * If deletion is successful, the browser will be redirected to the 'admin' page.
         * @param integer $id the ID of the model to be deleted
         */
        public function actionDelete($id)
        {
                $model = Users::model()->loadModel($id);
                $this->checkPrivilege($model, Acl::ACTION_DELETE);

                $model->delete();

                if (!isset($_GET['ajax']))
                        $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
        }

        /**
         * Lists all models.
         */
        public function actionIndex()
        {
                $this->hasPrivilege(Acl::ACTION_VIEW);
                $this->pageTitle = Lang::t(Common::pluralize($this->resourceLabel));

                

                $searchModel = UsersView::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'username', Users::model()->getFetchCondition());
               $this->render('index', array(
                    'model' => $searchModel,
                    
                ));
        }

        public function actionChangeStatus($id, $status)
        {
                $model = Users::model()->loadModel($id);
                $this->checkPrivilege($model);

                $this->hasPrivilege(Acl::ACTION_UPDATE);

                $model->status = $status;
                $model->save(FALSE);

                Yii::app()->user->setFlash('success', 'Success.');

                echo CJSON::encode(array
                    ('redirectLink' => $this->createUrl('view', array('id' => $model->id))));
        }

        public function actionActivityLog($id)
        {
                $this->resource = UserResources::RES_USER_ACTIVITY;
                $model = Users::model()->loadModel($id);
                $this->hasPrivilege(Acl::ACTION_VIEW);

                $this->pageTitle = Lang::t('Audit Trail');

                $this->renderPartial('log/_activity', array(
                    'model' => UserActivityLog::model()->searchModel(array('user_id' => $model->id), $this->settings[Constants::KEY_PAGINATION], 'date_created asc'),
                        ), FALSE, TRUE);
        }

        public function actionLoginLog($id)
        {
                $this->resource = UserResources::RES_USER_ACTIVITY;
                $this->pageTitle = Lang::t('Login History');

                $model = Users::model()->loadModel($id);
                $this->hasPrivilege(Acl::ACTION_VIEW);

                $this->renderPartial('log/_login', array(
                    'model' => UserLoginLog::model()->searchModel(array('user_id' => $model->id), $this->settings[Constants::KEY_PAGINATION], 'date_created asc'),
                        ), FALSE, TRUE);
        }

        public function actionDeleteLog($t)
        {
                $this->resource = UserResources::RES_USER_ACTIVITY;
                $this->hasPrivilege(Acl::ACTION_DELETE);
                if ($ids = filter_input(INPUT_POST, 'ids')) {
                        if ($t === self::LOG_ACTIVITY) {
                                UserActivityLog::model()->deleteMany($ids);
                        } else {
                                UserLoginLog::model()->deleteMany($ids);
                        }
                }
        }

        /**
         *
         * @param type $model
         * @param type $action
         * @throws CHttpException
         */
        protected function checkPrivilege($model, $action = Acl::ACTION_UPDATE)
        {
                if (!$model->canBeModified($this, $action))
                        throw new CHttpException(403, Lang::t('403_error'));
        }

}
