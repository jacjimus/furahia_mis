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
class Services extends ActiveRecord {
    
    const STATUS_ACTIVE = 'Active';
    const STATUS_CLOSED = 'Inactive';
    public $status;
    public $_search;

    const SEARCH_FIELD = '_search';
    
        public function tableName()
        {
                return 'sdp.sdp_services';
        }

        /**
         * @return array validation rules for model attributes.
         */
      public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
	            array(' cost', 'required'),
                    array('service_type, timestamp, user_id', 'numerical', 'integerOnly' => true),
                    array('sp_client, service_name, service_id, service_status, service_table, cost, costing_type', 'length', 'max' => 300),
                    array('keyword', 'length', 'max' => 20),
                    array('short_code', 'length', 'max' => 12),
                    // The following rule is used by search().
                    // @todo Please remove those attributes that should not be searched.
                    array('id,' . self::SEARCH_FIELD, 'safe', 'on' => self::SCENARIO_SEARCH),
                );
	}
        
        public function afterFind()
        {
                $this->cost = number_format($this->cost / 100 , 2 , '.',',');
                $this->timestamp = gmdate('dS-M-Y' , $this->timestamp);
                $this->service_status = ($this->service_status === '1') ? "Active" : "Inactive";
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
			'service_type' => 'Service Type',
			'timestamp' => 'Date Created',
			'user_id' => 'User',
			'sp_client' => 'Sp Client',
			'service_name' => 'Service Name',
			'service_id' => 'Service',
			'service_status' => 'Service Status',
			'service_table' => 'Service Table',
			'cost' => 'Cost',
			'costing_type' => 'Costing Type',
			'keyword' => 'Keyword',
			'short_code' => 'Short Code',
			'startstop_correlator' => 'Startstop Correlator',
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
        function getFullName()
{
    return $this->service_name.' - '.$this->keyword;
}

        /**
         * Update last login
         * @param type $id
         * @return type
         */
       

}
