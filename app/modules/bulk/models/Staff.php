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
class Staff extends ActiveRecord {

        
        const SCENARIO_ACTIVATE_ACCOUNT = 'activation';
        const SCENARIO_SIGNUP = 'sign_up';
        //status constants
        const STATUS_ACTIVE = "Active";
        const STATUS_PENDING = 'Pending';
        const STATUS_INACTIVE = 'Inactive';
        const SELECT = '';
        const SINGLE = 'Single';
        const MARRIED = 'Married';
        const DIVORCED = 'Divorced';
        //user resource prefix
        const USER_RESOURCE_PREFIX = 'USER_';

        /*The person*/
        public $person;
        
        /*The Person's First Name*/
        public $first_name;
        /*The Person's Last Name*/
        public $last_name;
        /*The Person's Middle Name*/
        public $middle_name;
        /*The Person's Email*/
        public $email;
        /*The Person's address*/
        public $address;
       
        /*The Person's Phone number*/
        public $phone;
        
        /*Spouse details*/
        public $spouse_name;
        public $spouse_age;
        public $spouse_idno;
        public $marriage_status;
        public $birthdate_estimated;
        
        
        public $nssf_no;
        public $gender;
       
        /**
         *
         * @var type
         */
        public $send_email = false;

        /**
         * confirm password
         * @var type
         */
        public $confirm;
        
       
        /**
         * Current user password
         * Used for when a user wants to change his/her password
         * @var type
         */
        public $currentPassword;
        
        
        public $level;
        
        public $department;
        
        public $temp_profile_image;

        /**
         * temp buffer for new password during password reset action
         * @var type
         */
        public $pass;
        
        
        public $status;
        
        /**
         * The department of the employee , ussually from the dept table
         * @var type
         */
        
       
        /**
         *
         * @var type
         */
        public $verifyCode;

        //profile actions constants
        const ACTION_UPDATE_PERSONAL = 'u_personal';
        const ACTION_UPDATE_ACCOUNT = 'u_account';
        const ACTION_UPDATE_ADDRESS = 'u_address';
        const ACTION_RESET_PASSWORD = 'reset_p';
        const ACTION_CHANGE_PASSWORD = 'change_p';

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
                return 'employee';
        }

        /**
         * @return array validation rules for model attributes.
         */
        public function rules()
        {
                return array(
                    array('id_no, title, dept_id, location_id, staff_no, level_id, marriage_status', 'required'),
                    array('person_id, dept_id,level_id, created_by, phone', 'numerical', 'integerOnly' => true),
                    array('last_modified', 'length', 'max' => 11),
                    array('phone', 'length', 'max' => 10),
                    array('nssf_no, nhif_no, passport_no', 'length', 'max' => 15),
                    array('date_created, birthdate, title, employment_date, last_modified', 'safe'),
                    array('id_no , staff_no', 'unique', 'message' => Lang::t('{value} is not available')),
                    array('id_no', 'length', 'min' => 5, 'max' => 8, 'on' => ActiveRecord::SCENARIO_CREATE . ',' . self::SCENARIO_SIGNUP, 'message' => Lang::t('{attribute} length should be between {min} and {max}.')),
                    array('id, title' . self::SEARCH_FIELD, 'safe', 'on' => self::SCENARIO_SEARCH),
                );
        }

        /**
         * @return array relational rules.
         */
        public function relations()
        {
                return array(
                    'person' => array(self::HAS_MANY, 'Person', 'id'),
                    'location' => array(self::HAS_MANY, 'Location', 'id'),
                );
        }

        /**
         * @return array customized attribute labels (name=>label)
         */
        public function attributeLabels()
        {
                return array(
                    'id' => Lang::t('ID'),
                    'id_no' => Lang::t('ID NO'),
                    'first_name' => Lang::t('First Name'),
                    'title' => Lang::t('Title'),
                    'passport_no' => Lang::t('Passport No'),
                    'nssf_no' => Lang::t('NSSF NO'),
                    'nhif_no' => Lang::t('NHIF NO'),
                    'date_created' => Lang::t('Date Created'),
                    'employment_date' => Lang::t('Date Employed'),
                    'last_modified' => Lang::t('Last Modified'),
                    'marriage_status' => Lang::t('Marriage Status'),
                    'status' => Lang::t('Staff Status'),
                    'location_id' => Lang::t('Office Location'),
                    'created_by' => Lang::t('Created By'),
                    'staff_no' => Lang::t('Staff No'),
                    'role_id' => Lang::t('Role'),
                    'level_id' => Lang::t('Staff Role'),
                    'dept_id' => Lang::t('Department'),
                    'timezone' => Lang::t('Timezone'),
                   'last_login' => Lang::t('Last Login'),
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

        public function afterSave()
        {
                if ($this->scenario === self::SCENARIO_UPDATE) {
                        $this->updateDeptUser();
                        Dept::model()->updateContactPerson($this->dept_id, $this->id);
                }
                return parent::afterSave();
        }
        public function beforeSave()
        {
            $this->status = Staff::STATUS_ACTIVE;
                return parent::beforeSave();
        }

        public function afterFind()
        {
                $this->person = $this->getPerson($this->person_id);
                $this->location = $this->getLocation($this->location_id);
                $this->department = $this->getDepartment($this->dept_id);
                $this->level = $this->getLevel($this->level_id);
                return parent::afterFind();
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
        public function validatePassword($password)
        {
                return $this->salt . md5($password) !== $this->password;
        }

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
        public static function marriageStatusOptions()
        {
                return array(
                    self::SELECT => Lang::t(self::SELECT),
                    self::SINGLE => Lang::t(self::SINGLE),
                    self::MARRIED => Lang::t(self::MARRIED),
                    self::DIVORCED => Lang::t(self::DIVORCED),
                    
                );
        }

        /**
         * Get fetch condition based on the user level
         * @return string
         * @throws CHttpException
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
        public function getPerson($id)
        {
                if (empty($id))
                        return NULL;
                $person = Person::model()->getScaler('CONCAT(first_name," ",last_name)', '`id`=:t1 ', array(':t1' => $id));
                return !empty($person) ? $person : NULL;
        }
        public function getLocation($id)
        {
                if (empty($id))
                        return NULL;
                $location = Location::model()->getScaler('name', '`id`=:t1 ', array(':t1' => $id));
                return !empty($location) ? $location : NULL;
        }
        public function getDepartment($id)
        {
                if (empty($id))
                        return NULL;
                $dept = Dept::model()->getScaler('name', '`id`=:t1 ', array(':t1' => $id));
                return !empty($dept) ? $dept : NULL;
        }
        public function getLevel($id)
        {
                if (empty($id))
                        return NULL;
                $level = Level::model()->getScaler('name', '`id`=:t1 ', array(':t1' => $id));
                return !empty($level) ? $level : NULL;
        }

        /**
         * Update user dept
         */
        public function updateDeptUser()
        {
                if (!empty($this->dept_id)) {
                        if (!DeptUser::model()->exists('`person_id`=:t1 AND `dept_id`=:t2 AND `has_left`=:t3', array(':t1' => $this->id, ':t2' => $this->dept_id, ':t3' => 0))) {
                                DeptUser::model()->removeUserFromDept($this->id);
                                DeptUser::model()->addUserToDept(array(
                                    'person_id' => $this->id,
                                    'dept_id' => $this->dept_id,
                                    'date_created' => new CDbExpression('NOW()'),
                                    'created_by' => Yii::app() instanceof CWebApplication ? Yii::app()->user->id : NULL,
                                ));
                        }
                } else {
                        DeptUser::model()->removeUserFromDept($this->id);
                }
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
