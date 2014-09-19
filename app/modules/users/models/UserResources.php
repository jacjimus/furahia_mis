<?php

/**
 * This is the model class for table "user_resources".
 *
 * The followings are the available columns in table 'user_resources':
 * @property string $id
 * @property string $description
 * @property integer $viewable
 * @property integer $createable
 * @property integer $updateable
 * @property integer $deleteable
 *
 * The followings are the available model relations:
 * @property UserRolesOnResources[] $usersRolesOnResources
 */
class UserResources extends ActiveRecord {

        //system resources should correspond to those saved in the db:

        const RES_SETTINGS_GENERAL = 'SETTINGS_GENERAL';
        const RES_SETTINGS_EMAIL = 'SETTINGS_EMAIL';
        const RES_SETTINGS_RUNTIME = 'SETTINGS_RUNTIME';
        const RES_SETTINGS_TOWN = 'SETTINGS_TOWN';
        const RES_SETTINGS_UNITS_OF_MEASURE = 'SETTINGS_UNITS_OF_MEASURE';
        const RES_SETTINGS_TAXES = 'SETTINGS_TAXES';
        const RES_SETTINGS_CRON = 'SETTINGS_CRON';
        const RES_MODULES_ENABLED = 'MODULES_ENABLED';
        const RES_USER_ROLES = 'USER_ROLES';
        const RES_USER_RESOURCES = 'USER_RESOURCES';
        const RES_USER_ENGINEER = 'USER_ENGINEER';
        const RES_USER_SUPERADMIN = 'USER_SUPERADMIN';
        const RES_USER_ADMIN = 'USER_ADMIN';
        const RES_USER_DEFAULT = 'USER_DEFAULT';
        const RES_USER_LEVELS = 'USER_LEVELS';
        const RES_USER_ACTIVITY = 'USER_ACTIVITY';
        const RES_DOCUMENTATION = 'DOCUMENTATION';
        const RES_MESSAGE = 'MESSAGE';
        const RES_DEPT = 'DEPT';
        const RES_BULK = 'BULK';
        const RES_BULK_CUSTOME = 'BULK_CUSTOME';
        const RES_BULK_TEMPLATES = 'BULK_TEMPLATE';
        const RES_HR = 'HUMAN_RESOURCE';
        const RES_HR_WELFARE = 'HR_WELFARE';
        const RES_HR_LEAVE = 'HR_LEAVE';
        const RES_FIN = 'FINANCE';
        const RES_LAND_RATES = 'LAND_RATES';
        const RES_SUBS = 'SUBS';
        const RES_SUBS_LOGS = 'SUBS_LOGS';
        const RES_MARKET_FEES = 'MARKET_FEES';
        const RES_HR_REPORTS = 'HR_REPORTS';
        const RES_REPORTS = 'REPORTS';
        const RES_REPORTS_SUB = 'REPORTS_SUBS';
        const RES_REPORTS_TERM = 'REPORTS_TERM';
        const RES_REPORTS_PARTNERS = 'REPORTS_PARTNERS';
        const RES_REPORTS_SETUP = 'REPORTS_SETUP';
        const RES_CALL_MANAGER = 'CALL_MANAGER';
        const RES_CALL_NEW = 'CALL_NEW';
        const RES_CALL_WAITING = 'CALL_WAITING';
        const RES_CALL_PROCESSED = 'CALL_PROCESSED';
        const RES_CALL_ESCALATED = 'CALL_ESCALATED';
        const RES_CALL_REPORTS = 'CALL_REPORTS';

        /**
         * Returns the static model of the specified AR class.
         * @param string $className active record class name.
         * @return UserResources the static model class
         */
        public static function model($className = __CLASS__)
        {
                return parent::model($className);
        }

        /**
         * @return string the associated database table name
         */
        public function tableName()
        {
                return 'user_resources';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {

                return array(
                    array('id,description', 'required'),
                    array('viewable, createable, updateable, deleteable', 'numerical', 'integerOnly' => true),
                    array('id', 'length', 'max' => 128),
                    array('id', 'unique'),
                    array('description', 'length', 'max' => 255),
                    array('id,' . self::SEARCH_FIELD, 'safe', 'on' => self::SCENARIO_SEARCH),
                );
        }

        /**
         * @return array relational rules.
         */
        public function relations()
        {
                return array(
                    'usersRolesOnResources' => array(self::HAS_MANY, 'UserRolesOnResources', 'resource_id'),
                );
        }

        /**
         * @return array customized attribute labels (name=>label)
         */
        public function attributeLabels()
        {
                return array(
                    'id' => Lang::t('ID'),
                    'description' => Lang::t('Description'),
                    'viewable' => Lang::t('Viewable'),
                    'createable' => Lang::t('Createable'),
                    'updateable' => Lang::t('Updateable'),
                    'deleteable' => Lang::t('Deleteable'),
                );
        }

        public function searchParams()
        {
                return array(
                    array('description', self::SEARCH_FIELD, true, 'OR'),
                    array('id', self::SEARCH_FIELD, true, 'OR'),
                    'id',
                );
        }

        /**
         * Get resources
         * @param type $exluded_resources. Resources not to be included
         * @return type
         */
        public function getResources($exluded_resources = null)
        {
                $command = Yii::app()->db->createCommand()
                        ->select()
                        ->from($this->tableName());
                if (!empty($exluded_resources))
                        $command->where(array('NOT IN', 'id', $exluded_resources));
                return $command->queryAll();
        }

}
