<?php


class DefaultController extends ReportsModuleController {

        public function init()
        {
                $this->resource = UserResources::RES_REPORTS;
                
                $this->resourceLabel = 'Subscription Reports';
                
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
                        'actions' => array('sub', 'showSubReports', 'weeklySubs', 'monthlySubs', 'CustomSubs',),
                        'users' => array('@'),
                    ),
                    array('deny', // deny all users
                        'users' => array('*'),
                    ),
                );
        }

         public function actionSub()
        {
                $this->hasPrivilege(Acl::ACTION_CREATE);
                $this->activeMenu = self::MENU_SUBS;
                $this->pageTitle = Lang::t($this->resourceLabel);

                $model = new Syncorder();
                $model_class_name = $model->getClassName();

                

                $this->render('index', array(
                    'model' => $model,
                ));
        }
        
        public function actionShowSubReports()
        {
            $this->renderPartial('ajax/daily');
        }
        public function actionWeeklySubs()
        {
            $this->renderPartial('ajax/weekly');
        }
        public function actionMonthlySubs()
        {
            $this->renderPartial('ajax/monthly');
        }
        public function actionCustomSubs()
        {
            $this->renderPartial('ajax/custome');
        }
         public function getReportName($id)
        {
          if (empty($id))
                        return NULL;
                $dept_id = Report::model()->getScaler('name', '`id`=:t1', array(':t1' => $id));
                return !empty($dept_id) ? $dept_id : NULL; 
        }
}
