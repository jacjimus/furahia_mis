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
class Child extends ActiveRecord {

        
        const SCENARIO_ACTIVATE_ACCOUNT = 'activation';
        
        const STATUS_ACTIVE = "Active";
        const STATUS_INACTIVE = 'Inactive';
        //user resource prefix
        const USER_RESOURCE_PREFIX = 'USER_';

        /**
         *
         * @var type
         */
        

        public function behaviors()
        {
                $behaviors = array();
                $behaviors['UserBehavior'] = array(
                    'class' => 'application.modules.users.components.behaviors.UserBehavior',
                );
                return array_merge(parent::behaviors(), $behaviors);
        }

        /**
         * @return string the associated database table name
         */
        public function tableName()
        {
                return 'employee_kids';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {
                return array(
                    array('id, name, employee_id, cert_no, status, dob', 'required'),
                    array('employee_id, id', 'numerical', 'integerOnly' => true),
                    array('cert_no', 'length', 'max' => 11),
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
                    'name' => Lang::t('Child Name'),
                    'cert_no' => Lang::t('Birth Cert No'),
                    'dob' => Lang::t('Date of Birth'),
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

        public function beforeDelete()
        {
                Person::model()->loadModel($this->id)->delete();
                return parent::beforeDelete();
        }

        /**
         * Validate password for login
         * @param type $password
         * @return type
         */
       

        /**
         * Get user levels to display in the dropdown list
         * @param type $controller
         * @return type
         */
        public function getUserLevels($controller)
        {
                $values = UserLevels::model()->getListData('id', 'description', false, '`id`<>:t1', array(':t1' => UserLevels::LEVEL_MEMBER), 'rank desc');

                foreach ($values as $k => $v) {
                        if (!$controller->showLink(self::USER_RESOURCE_PREFIX . $k))
                                unset($values[$k]);
                }

                return $values;
        }

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
        
        public function searchme($id)
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('dob',$this->dob,true);
		$criteria->compare('employee_id',$this->employee_id = $id);
		$criteria->compare('cert_no',$this->cert_no,true);
		

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

}
