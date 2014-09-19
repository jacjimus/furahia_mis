<?php

/**
 * This is the model class for table "person".
 *
 * The followings are the available columns in table 'person':
 * @property string $id
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $gender
 * @property string $birthdate
 * @property integer $birthdate_estimated
 * @property string $profile_image
 * @property string $date_created
 * @property string $created_by
 * @property string $last_modified
 *
 * The followings are the available model relations:
 * @property PersonAddress[] $personAddresses
 */
class Location extends ActiveRecord {

        const STATUS_OPEN = 'Open';
        const STATUS_CLOSED = 'Closed';
    
        public function tableName()
        {
                return 'office_location';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {
                return array(
                    array('name ', 'required'),
                     array('birthdate', 'date', 'format' => 'yyyy-M-d', 'message' => Lang::t('Please choose a valid birthdate')),
                    array('id, name,description, date_created', 'safe'),
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
                    'id' => Lang::t('ID'),
                    'name' => Lang::t('Office Name'),
                    'description' => Lang::t('Description'),
                    'date_created' => Lang::t('Date Created'),
                );
        }

        /**
         * Returns the static model of the specified AR class.
         * Please note that you should have this exact method in all your CActiveRecord descendants!
         * @param string $className active record class name.
         * @return Person the static model class
         */
        public static function model($className = __CLASS__)
        {
                return parent::model($className);
        }
        public static function statusOptions()
        {
                return array(
                    self::STATUS_OPEN => Lang::t(self::STATUS_OPEN),
                    self::STATUS_CLOSED => Lang::t(self::STATUS_CLOSED),
                );
        }

     
        
}
