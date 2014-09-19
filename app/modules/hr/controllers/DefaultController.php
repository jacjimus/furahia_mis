<?php


class DefaultController extends HrModuleController {

        public function init()
        {
                $this->resource = UserResources::RES_HR;
                $this->activeMenu = self::MENU_HR;
                $this->resourceLabel = 'Human Resources';
                $this->resourceAddLabel = 'Manage Staff';
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
                        'actions' => array('index', 'view', 'create', 'update', 'delete','details' , 'add'),
                        'users' => array('@'),
                    ),
                    array('deny', // deny all users
                        'users' => array('*'),
                    ),
                );
        }

        
        public function actionDetails($id)
        {
                $this->hasPrivilege(Acl::ACTION_VIEW);

                $spouse = Spouse::model()->loadMod(array('employee_id'=>$id));
                 $this->pageTitle = "Staff family details";
                $model_class_name = $spouse->getClassName();
               
                if (isset($_POST[$model_class_name])) {
                        $spouse->attributes = $_POST[$model_class_name];
                        
                        if ($spouse->save()) {
                                Yii::app()->user->setFlash('success', Lang::t('Spouse saved successfully. Now create the siblings.'));
                               // $this->redirect(Yii::app()->createUrl('staff/default/index'));
                        }
                }
                $this->render('family', array(
                    'spouse' => $spouse,
                    'id' => $id,
                ));
        }
        public function actionAdd($id)
        {
                $this->hasPrivilege(Acl::ACTION_VIEW);

               $child = new Child();
               $model_class_name = $child->getClassName();
               
                if (isset($_POST[$model_class_name])) {
                  {
                    $child->attributes = $_POST[$model_class_name];
                
                    
                            if (Yii::app()->request->isAjaxRequest)
                {
					Yii::app()->clientScript->scriptMap['jquery.js'] = false;
                    echo CJSON::encode(array(
                        'status'=>'success', 
                        'div'=>"Child added successful"
                        ));
						
                //Close the dialog, reset the iframe and update the grid
               // echo CHtml::script("window.parent.$.fn.yiiGridView.update('#prevExp-grid');");
             
            
                    exit;               
                }
				else
				$this->redirect(array('../products/view','id'=>$child->id));
		}
		
		if (Yii::app()->request->isAjaxRequest)
        {
			Yii::app()->clientScript->scriptMap['jquery.js'] = false;
            echo CJSON::encode(array(
                'status'=>'failure', 
                'div'=>$this->renderPartial('_kid', array('child'=>$child),true, true)));
            exit;               
        }
        else
		$this->render('_kid',array(
			'child'=>$child,
		));
	}
        }
       

        public function actionCreate()
        {
                $this->hasPrivilege(Acl::ACTION_CREATE);
                $this->pageTitle = Lang::t('New ' . $this->resourceAddLabel);
                // User information
                $user_model = new Users(ActiveRecord::SCENARIO_CREATE);
                $user_model->status = Users::STATUS_ACTIVE;
                $user_model_class_name = $user_model->getClassName();
               
                //personal information
                $person_model = new Person();
                $person_model_class_name = $person_model->getClassName();
                
                //staff information
                $staff_model = new Staff(ActiveRecord::SCENARIO_CREATE);
                $staff_model->status = Staff::STATUS_ACTIVE;
                $staff_model_class_name = $staff_model->getClassName();
                
                
               if (Yii::app()->request->isPostRequest) {
                   
                       $user_model->attributes = $_POST[$user_model_class_name];
                       $person_model->attributes = $_POST[$person_model_class_name];
                       $staff_model->attributes = $_POST[$staff_model_class_name];

                       
                        $person_model->validate();
                        $staff_model->validate();
                        $user_model->validate();
                        if ( !$user_model->hasErrors() && !$staff_model->hasErrors() && !$person_model->hasErrors() ) {
                            if ($user_model->save(FALSE)) {
                            $person_model->id = $user_model->id;
                                if ($person_model->save(FALSE)) {
                                    
                                        $staff_model->person_id = $person_model->id;
                                        $staff_model->save(FALSE);
                        
                                Yii::app()->user->setFlash('success', Lang::t('Staff added successfully.'));
                                 $this->redirect(Controller::getReturnUrl($this->createUrl('view', array('id' => $staff_model->id))));
                        }
                        }
                        }
                }

                $this->render('create', array(
                    'staff_model' => $staff_model,
                    'user_model' => $user_model,
                    'model' => $person_model,
                ));
        }
        public function actionView($id = NULL, $action = NULL)
        {
                if (NULL === $id)
                $id = Yii::app()->user->id;
               
                $staff_model = Staff::model()->loadModel($id);
                $user_model = Users::model()->loadModel($staff_model->person_id);
                $person_model = Person::model()->loadModel($staff_model->person_id);
                
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
                    'staff_model' => $staff_model,
                    'address_model' => $address_model,
                    'action' => $action
                ));
        }

        public function actionUpdate($id)
        {
                $this->hasPrivilege(Acl::ACTION_UPDATE);
                $this->pageTitle = Lang::t('Edit ' . $this->resourceLabel);

                $model = Staff::model()->loadModel($id);
                $model_class_name = $model->getClassName();

                if (isset($_POST[$model_class_name])) {
                        $model->attributes = $_POST[$model_class_name];
                        if ($model->save()) {
                                Yii::app()->user->setFlash('success', Lang::t('SUCCESS_MESSAGE'));
                                $this->redirect(Controller::getReturnUrl($this->createUrl('view', array('id' => $model->id))));
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
        public function loadSpouse($id)
        {
                $model = Spouse::model()->findByAttributes(array('employee_id' => $id));
                if ($model === null)
                        $model = new Spouse();
                return $model;
        }
        public function loadChild($id)
        {
                $model = Child::model()->findByAttributes(array('employee_id' => $id));
                if ($model === null)
                        $model = new Child();
                return $model;
        }

}
