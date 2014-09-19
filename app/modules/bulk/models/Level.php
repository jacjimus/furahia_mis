<?php

/**
 * This is the model class for table "employee_level".
 *
 * The followings are the available columns in table 'employee_level':
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property string $date_created
 * @property string $created_by
 * @property integer $retired
 *
 * The followings are the available model relations:
 * @property Employee[] $employees
 */
class Level extends ActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'employee_level';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, date_created', 'required'),
			array('retired', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>128),
			array('description', 'length', 'max'=>255),
			array('created_by', 'length', 'max'=>11),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, description, date_created, created_by, retired', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'employees' => array(self::HAS_MANY, 'Employee', 'level_id'),
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
			'date_created' => 'Date Created',
			'created_by' => 'Created By',
			'retired' => 'Retired',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('date_created',$this->date_created,true);
		$criteria->compare('created_by',$this->created_by,true);
		$criteria->compare('retired',$this->retired);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Level the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
