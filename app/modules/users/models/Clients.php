<?php

/**
 * This is the model class for table "users".
 *
 * The followings are the available columns in table 'users':
 * @property integer $id
 * @property string $username
 * @property string $email
 * @property string $status
 * @property string $timezone
 * @property string $password
 * @property string $salt
 * @property string $password_reset_code
 * @property string $password_reset_date
 * @property string $password_reset_request_date
 * @property string $activation_code
 * @property string $user_level
 * @property integer $role_id
 * @property string $date_created
 * @property integer $created_by
 * @property string $last_modified
 * @property string $last_modified_by
 * @property string $last_login
 */
class Clients extends ActiveRecord {

       
        public function tableName()
        {
                return 'sdp.sp_clients';
        }

        /**
         * @return array validation rules for model attributes.
         */
       public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('client_name, client_email, phone_1, phone_2, timestamp, user_id', 'required'),
			array('timestamp, user_id', 'numerical', 'integerOnly'=>true),
			array('client_name, client_email, phone_1, phone_2', 'length', 'max'=>300),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, client_name, client_email, phone_1, phone_2, timestamp, user_id', 'safe', 'on'=>'search'),
		);
	}

        /**
         * @return array relational rules.
         */
        public function relations()
        {
                return array(
                );
        }

        /**
         * @return array customized attribute labels (name=>label)
         */
       public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'client_name' => 'Client Name',
			'client_email' => 'Client Email',
			'phone_1' => 'Phone 1',
			'phone_2' => 'Phone 2',
			'timestamp' => 'Timestamp',
			'user_id' => 'User',
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

        
        public function getUserLevels($controller)
        {
                $values = UserLevels::model()->getListData('id', 'description', true, '`id`<>:t1', array(':t1' => UserLevels::LEVEL_ENGINEER), 'rank desc');

                foreach ($values as $k => $v) {
                        $values[$k];
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
                    self::STATUS_PENDING => Lang::t(self::STATUS_PENDING),
                    self::STATUS_BLOCKED => Lang::t(self::STATUS_BLOCKED),
                );
        }

       
        public function canBeModified($controller, $type = Acl::ACTION_UPDATE)
        {
                return $controller->showLink(self::USER_RESOURCE_PREFIX . $this->user_level, $type) && Controller::$user_level !== $this->user_level;
        }

        /**
         * Get dept id of a user
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
       

}
