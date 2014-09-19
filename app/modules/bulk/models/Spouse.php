<?php

/**
 * This is the model class for table "users".
 *
 * The followings are the available columns in table 'users':
 * @property integer $id
 * @property string $name
 * @property string $employee_id
 * @property string $name
 * @property string $status
 
 */
class Spouse extends ActiveRecord {

        
        const SCENARIO_ACTIVATE_ACCOUNT = 'activation';
        
        const STATUS_ACTIVE = "Active";
        const STATUS_INACTIVE = 'Inactive';
        //user resource prefix
        const USER_RESOURCE_PREFIX = 'USER_';

        /**
         *
         * @var type
         */
        


        /**
         * @return string the associated database table name
         */
        public function tableName()
        {
                return 'employee_spouses';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {
                return array(
                    array('employee_id, spouse_name, spouse_age, spouse_idno', 'required'),
                    array('employee_id, id, spouse_age', 'numerical', 'integerOnly' => true),
                    array('spouse_idno', 'length', 'max' => 10),
                    array('id,' . self::SEARCH_FIELD, 'safe', 'on' => self::SCENARIO_SEARCH),
                );
        }

        /**
         * @return array relational rules.
         */
        public function relations()
        {
                return array(
                    'staff' => array(self::HAS_MANY, 'Staff', 'id'),
                    
                );
        }

        /**
         * @return array customized attribute labels (name=>label)
         */
        public function attributeLabels()
        {
                return array(
                    'id' => Lang::t('ID'),
                    'spouse_name' => Lang::t('Spouse Name'),
                    'spouse_idno' => Lang::t('Spouse ID NO'),
                    'spouse_age' => Lang::t('Spouse Age'),
                    'employee_id' => Lang::t('Staff ID'),
                    
                );
        }

        /**
         * Returns the static model of the specified AR class.
         * Please note that you should have this exact method in all your CActiveRecord descendants!
         * @param string $className active record class name.
         * @return Users the static model class
         */
        public static function model($className = __CLASS__)
        {
                return parent::model($className);
        }

        

        /**
         * Validate password for login
         * @param type $password
         * @return type
         */
       


        /**
         * Get user acc status (mainly for displayinng in dropdown list)
         * @return type
         */
        public static function statusOptions()
        {
                return array(
                    self::STATUS_ACTIVE => Lang::t(self::STATUS_ACTIVE),
                    self::STATUS_INACTIVE => Lang::t(self::STATUS_INACTIVE),
                    
                );
        }

        /**
         * Get fetch condition based on the user level
         * @return string
         * @throws CHttpException
         */
        
        /**
         * Whether the logged in user can update a given user
         * @param type $controller
         * @return type
         */
        public function canBeModified($controller, $type = Acl::ACTION_UPDATE)
        {
                return $controller->showLink(self::USER_RESOURCE_PREFIX . $this->user_level, $type) && Controller::$user_level !== $this->user_level;
        }

        /**
         * Get dept id of a user
         * @param type $id
         * @return type
         */
         public function getFetchCondition()
        {
                $condition = '(`user_level`<>"' . UserLevels::LEVEL_MEMBER . '")';
                switch (Controller::$user_level) {
                        case UserLevels::LEVEL_ENGINEER:
                                $condition .= "";
                                break;
                        case UserLevels::LEVEL_SUPERADMIN:
                                $condition .= ' AND (`user_level`<>"' . UserLevels::LEVEL_ENGINEER . '")';
                                break;
                        case UserLevels::LEVEL_ADMIN:
                                $condition .= ' AND (`user_level`<>"' . UserLevels::LEVEL_ENGINEER . '" AND `user_level`<>"' . UserLevels::LEVEL_SUPERADMIN . '")';
                                break;
                        default :
                                throw new CHttpException(403, Lang::t('403_error'));
                }

                return $condition;
        }
       
        /**
         * Check whether account belongs to a user
         * @param type $id
         * @return type
         */
        public static function isMyAccount($id)
        {
                return $id === Yii::app()->user->id;
        }

        /**
         * Update last login
         * @param type $id
         * @return type
         */
        public function updateLastLogin($id)
        {
                return Yii::app()->db->createCommand()
                                ->update($this->tableName(), array('last_login' => new CDbExpression('NOW()')), '`id`=:t1', array(':t1' => $id));
        }

}
