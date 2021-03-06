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
class BulkTemplate extends ActiveRecord implements IMyActiveSearch {
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
                return 'bulk_sms_template';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {

                return array(
                    array('key, description, client_id, body', 'required'),
                    array('created_by', 'numerical', 'integerOnly' => true),
                    array('key, description', 'length', 'max' => 128),
                    array('key', 'unique', 'message' => Lang::t('{value} already exists')),
                    array('body', 'length', 'max' => 200),
                    array('comments', 'safe'),
                    array('id,' . self::SEARCH_FIELD, 'safe', 'on' => self::SCENARIO_SEARCH),
                );
        }
        
        public function afterFind()
        {
                $this->client = $this->getClient($this->client_id);
                return parent::afterFind();
        }
        
        public function getClient($id)
        {
                if (empty($id))
                        return NULL;
                $dept_id = Clients::model()->getScaler('client_name', '`id`=:t1', array(':t1' => $id));
                return !empty($dept_id) ? $dept_id : NULL;
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
                    'id' => Lang::t('ID'),
                    'key' => Lang::t('Key'),
                   
                    'body' => Lang::t('Body'),
                    
                    'description' => Lang::t('Description'),
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

