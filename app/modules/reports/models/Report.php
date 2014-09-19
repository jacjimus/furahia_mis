<?php

/**
 * This is the model class for table "settings_email_template".
 *
 * The followings are the available columns in table 'settings_email_template':
 * @property integer $id
 * @property string $key
 * @property string $description
 * @property string $subject
 * @property string $body
 * @property string $from
 * @property string $comments
 * @property string $date_created
 * @property integer $created_by
 */
class Report extends ActiveRecord implements IMyActiveSearch {
        //email template keys

       const SCENARIO_NOT_ADMIN = 'n_admin';
       
       public $client;

        /**
         * Returns the static model of the specified AR class.
         * @param string $className active record class name.
         * @return SettingsEmailTemplate the static model class
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
                return 'sdp.tblcustomereports';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {

                return array(
                    
			array('name, start_date, end_date', 'required'),
			array('name', 'length', 'max'=>25),
			array('description', 'length', 'max'=>100),
			array('start_date, end_date', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, description, start_date, end_date', 'safe', 'on'=>'search'),
		
                    array('id,' . self::SEARCH_FIELD, 'safe', 'on' => self::SCENARIO_SEARCH),
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
			'name' => 'Name',
			'description' => 'Description',
			'start_date' => 'Start Date',
			'end_date' => 'End Date',
		);
	
        }

        public function searchParams()
        {
                return array(
                    array('id', self::SEARCH_FIELD, true, 'OR'),
                    array('description', self::SEARCH_FIELD, true, 'OR'),
                    'id',
                );
        }

        /**
         * Find email template by key
         * @param type $key
         * @return type
         * @throws CHttpException
         */
        public function findByKey($key)
        {
                $model = $this->find('`key`=:t1', array(':t1' => $key));
                if ($model === null)
                        throw new CHttpException(500, 'No email template with the given key: ' . $key);
                return $model;
        }

}

