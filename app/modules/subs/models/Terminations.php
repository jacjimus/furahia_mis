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
class Terminations extends ActiveRecord {
    
    const STATUS_ACTIVE = 'Active';
    const STATUS_CLOSED = 'Inactive';
    public $status;
    public $service_name;
    public $count_active;
    public $amount_charged;
    public $_search;

    const SEARCH_FIELD = '_search';
    
        public function tableName()
        {
                return 'sdp.outgoingsms_delivered';
        }

        /**
         * @return array validation rules for model attributes.
         */
      public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('service_id', 'required'),
			array('timestamp, user_id, auto_reply, flagged, client', 'numerical', 'integerOnly'=>true),
			array('productid, serviceid, servicelist, updatetype, updatetime, updatedesc, effectivetime, expirytime, extensioninfo, dest_msisdn, userid_type, spid', 'length', 'max'=>300),
			array('fulldump', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			  array('id,' . self::SEARCH_FIELD, 'safe', 'on' => self::SCENARIO_SEARCH),
		);
	}
        
        public function afterFind()
        {
            $this->service_name = $this->getName($this->service_id);
            $this->amount_charged = $this->getAmountName($this->service_id);
            $this->timestamp = gmdate("Y-m-d H:i:s", $this->timestamp);;
            return parent::afterFind(); 
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
			'productid' => 'Productid',
			'serviceid' => 'Serviceid',
			'servicelist' => 'Servicelist',
			'updatetype' => 'Updatetype',
			'updatetime' => 'Updatetime',
			'updatedesc' => 'Updatedesc',
			'effectivetime' => 'Effectivetime',
			'expirytime' => 'Expirytime',
			'extensioninfo' => 'Extensioninfo',
			'fulldump' => 'Fulldump',
			'timestamp' => 'Timestamp',
			'user_id' => 'User',
			'dest_msisdn' => 'Phone Number',
			'userid_type' => 'Userid Type',
			'spid' => 'Spid',
			'sub' => 'Subscription type',
			'auto_reply' => 'Auto Reply',
			'flagged' => 'Flagged',
			'client' => 'Client',
			'report_name' => 'Custom Report',
			'service_name' => 'Service Name',
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

        
       
        public static function statusOptions()
        {
                return array(
                    self::STATUS_ACTIVE => Lang::t(self::STATUS_ACTIVE),
                   self::STATUS_CLOSED => Lang::t(self::STATUS_CLOSED),
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
        public function getName($id)
        {
                if (empty($id))
                        return NULL;
                $name = Services::model()->getScaler('service_name', '`service_id`=:t1 ', array(':t1' => $id));
                return !empty($name) ? $name : NULL;
        }
        public function getAmountName($id)
        {
                if (empty($id))
                        return NULL;
                $name = Services::model()->getScaler('cost', '`service_id`=:t1 ', array(':t1' => $id));
                return !empty($name) ? $name / 100 : NULL;
        }

        /**
         * Update last login
         * @param type $id
         * @return type
         */
       

}
