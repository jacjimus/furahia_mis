<?php

/**
 * Home controller
 * @author James Makau <jacjimus@gmail.com>
 */
class DefaultController extends AdminModuleController {

    public function init() {
        parent::init();
        $this->activeMenu = self::MENU_DASHBOARD;
    }

    /**
     * @return array action filters
     */
    public function filters() {
        return array(
            'accessControl', // perform access control for CRUD operations
        );
    }

    /**
     * Specifies the access control rules.
     * This method is used by the 'accessControl' filter.
     * @return array access control rules
     */
    public function accessRules() {
        return array(
            array('allow',
                'actions' => array('index', 'profile', 'chart', 'monthly_term'),
                'users' => array('@'),
            ),
            array('deny', // deny all users
                'users' => array('*'),
            ),
        );
    }

    /**
     * Declares class-based actions.
     */
    public function actions() {
        return array(
            // captcha action renders the CAPTCHA image displayed on the contact page
            'captcha' => array(
                'class' => 'CCaptchaAction',
                'backColor' => 0xFFFFFF,
            ),
            // page action renders "static" pages stored under 'protected/views/site/pages'
            // They can be accessed via: index.php?r=site/page&view=FileName
            'page' => array(
                'class' => 'CViewAction',
            ),
        );
    }

    /**
     * This is the default 'index' action that is invoked
     * when an action is not explicitly requested by users.
     */
    public function actionIndex($id = NULL, $action = NULL) {
        
        $this->pageTitle = 'Dashboard';
        $this->render('dashboard', array(
            'model' => new Syncorder(),
        ));
    }

    public function actionMonthly_term() {
        Yii::app()->fusioncharts->setChartOptions(array('caption' => 'Monthly Terminations', 'xAxisName' => 'Date', 'yAxisName' => 'No of Terminations', 'labelDisplay' => 'ROTATE' ,'slantLabels'=>'1' , 'showValues'=>0 ));

                
        $this->getDays();

        $this->getDataSets();
        $this->addToDataSets();

        Yii::app()->fusioncharts->useI18N = true;

        Yii::app()->fusioncharts->getXMLData(true);
    }

    public function actionChart() {
        Yii::app()->fusioncharts->setChartOptions(array('caption' => 'Short Codes Perfomance', 'xAxisName' => 'Short Codes', 'yAxisName' => 'No of Terminations', ));


        Yii::app()->fusioncharts->addCategory(array('label' => 'Monday'));
        Yii::app()->fusioncharts->addCategory(array('label' => 'Tuesday'));

        $options = array('seriesName' => '21444'); // must specify series anme
        Yii::app()->fusioncharts->addDataSet('data_unique_key', $options);
        $options = array('seriesName' => '20323'); // must specify series anme
        Yii::app()->fusioncharts->addDataSet('data_unique_key2', $options);
        $options = array('seriesName' => '20323'); // must specify series anme
        Yii::app()->fusioncharts->addDataSet('data_unique_key3', $options);
        $options = array('seriesName' => '20433'); // must specify series anme
        Yii::app()->fusioncharts->addDataSet('data_unique_key4', $options);
        $options = array('seriesName' => '20770'); // must specify series anme
        Yii::app()->fusioncharts->addDataSet('data_unique_key5', $options);


        $options = array('value' => 5000);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key', $options);
        $options = array('value' => 8900);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key', $options);
        $options = array('value' => 6090);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key', $options);
        $options = array('value' => 5687);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key', $options);
        $options = array('value' => 3450);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key', $options);
        $options = array('value' => 12000);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key', $options);

        $options = array('value' => 3000);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key2', $options);
        $options = array('value' => 4567);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key2', $options);
        $options = array('value' => 3345);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key2', $options);
        $options = array('value' => 4678);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key2', $options);
        $options = array('value' => 3456);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key2', $options);
        $options = array('value' => 4900);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key2', $options);

        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key3', $options);
        $options = array('value' => 6000);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key3', $options);
        $options = array('value' => 5567);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key3', $options);
        $options = array('value' => 4045);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key3', $options);
        $options = array('value' => 6744);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key3', $options);
        $options = array('value' => 4567);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key3', $options);

        $options = array('value' => 9808);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key4', $options);
        $options = array('value' => 5678);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key4', $options);
        $options = array('value' => 2345);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key4', $options);
        $options = array('value' => 7544);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key4', $options);
        $options = array('value' => 5655);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key4', $options);
        $options = array('value' => 3333);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key4', $options);

        $options = array('value' => 7754);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key5', $options);
        $options = array('value' => 5444);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key5', $options);
        $options = array('value' => 5553);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key5', $options);
        $options = array('value' => 1654);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key5', $options);
        $options = array('value' => 6744);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key5', $options);
        $options = array('value' => 5444);
        Yii::app()->fusioncharts->addSetToDataSet('data_unique_key5', $options);


        Yii::app()->fusioncharts->useI18N = true;

        Yii::app()->fusioncharts->getXMLData(true);
    }

    public function actionProfile($id = NULL, $action = NULL) {
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

    private function getDays() {

        $currentdays = intval(date("t"));
        $str = date('M-Y');
        $i = 0;
        $days = array();
        while ($i++ < $currentdays) {
            $days[] = Yii::app()->fusioncharts->addCategory(array('label' => $i . '-' . $str));
        }
        return $days;
    }

    private function getDataSets($val = NULL) {
        $i = 1;
        $dataset = array();
        $sql = "SELECT DISTINCT short_code from sdp.sdp_services WHERE costing_type = 1 order by short_code";
            foreach (Yii::app()->db->createCommand($sql)->queryAll() as $row)
            {
        $options = array('seriesName' => $row['short_code']); // must specify series anme
        $dataset[] = Yii::app()->fusioncharts->addDataSet('data_unique_key'.$i, $options);
        $i++;
        
            }
                return $dataset;
    }
    private function addToDataSets($val = NULL) {
        $i = 1;
        $dataset = array();


        $sql = "SELECT DISTINCT short_code from sdp.sdp_services WHERE costing_type = 1 order by short_code ";

        foreach (Yii::app()->db->createCommand($sql)->queryAll() as $row) {
            $currentdays = intval(date("t"));
            $k = 0;
            $set = array();


            while ($k++ < $currentdays) {
                $short_code = $row['short_code'];
                $sqlw = "call sdp.daily_val('$k' , '$short_code')";

                foreach(Yii::app()->db->createCommand($sqlw)->queryAll() As $val)
                {
                    $num = $val['count'];
                }
                $num = isset($num) ? $num : 0;
                   
                
                $options = array('value' => $num);
                //$set[] = 
                $dataset[] = Yii::app()->fusioncharts->addSetToDataSet('data_unique_key' . $i, $options);
                ;
                $num = 0;
            }

            $i++;
        }



        return $dataset;
    }

}
