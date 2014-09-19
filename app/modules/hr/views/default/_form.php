<?php
if (!isset($label_size)):
        $label_size = 3;
endif;
if (!isset($input_size)):
        $input_size = 7;
endif;
$grid_id = 'child-grid';
$label_class = "col-md-{$label_size} control-label";
$input_class = "col-md-{$input_size}";
$form_id = 'users-form';

$form = $this->beginWidget('CActiveForm', array(
    'id' => $form_id,
    'enableAjaxValidation' => false,
    'htmlOptions' => array('class' => 'form-horizontal', 'enctype' => 'multipart/form-data', 'role' => 'form'),
        ));
?>

        <div class="col-md-6">
                <div class="panel panel-default ">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Personal details') ?></h4>
                        </div>
                        <div class="panel-body">
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'staff_no', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($staff_model, 'staff_no', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($staff_model, 'staff_no') ?>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'id_no', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($staff_model, 'id_no', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($staff_model, 'id_no') ?>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'title', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($staff_model, 'title', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($staff_model, 'title') ?>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($model, 'first_name', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($model, 'first_name', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($model, 'first_name') ?>
                                        </div>
                                </div>
                            <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($model, 'middle_name', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($model, 'middle_name', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($model, 'middle_name') ?>
                                        </div>
                            </div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($model, 'last_name', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($model, 'last_name', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($model, 'last_name') ?>
                                        </div>
                                </div>
                                
                                
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'phone', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($staff_model, 'phone', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($staff_model, 'phone') ?>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'address', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextArea($staff_model, 'address', array('class' => 'form-control', 'rows' => 3)); ?>
                                                <?php echo CHtml::error($staff_model, 'address') ?>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($model, 'gender', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeDropDownList($model, 'gender', Person::genderOptions(), array('class' => 'form-control')); ?>
                                            <?php echo CHtml::error($model, 'gender') ?>
                                        </div>
                                </div>
                            <div class="form-group">
        <?php echo CHtml::activeLabelEx($model, 'birthdate', array('class' => $label_class)); ?>
        <div class="<?php echo $input_class ?>">
                <?php echo CHtml::activeDropDownList($model, 'birthdate_month', Person::birthDateMonthOptions(), array('style' => 'width:80px;')); ?>&nbsp;&nbsp;
                <?php echo CHtml::activeDropDownList($model, 'birthdate_day', Person::birthDateDayOptions(), array('style' => 'width:80px;')); ?>&nbsp;&nbsp;
                <?php echo CHtml::activeDropDownList($model, 'birthdate_year', Person::birthDateYearOptions(), array('style' => 'width:80px;')); ?>
                <?php echo CHtml::error($model, 'birthdate') ?>
        </div>
</div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'marriage_status', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeDropDownList($staff_model, 'marriage_status', Staff::marriageStatusOptions(), array('class' => 'form-control')); ?>
                                            <?php echo CHtml::error($staff_model, 'marriage_status') ?>
                                        </div>
                                </div>
                            
                        </div>
                </div>
        </div>
 <div class="col-md-6">
 <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#users">
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('Account details') ?>
                                </a>
                        </h4>
                </div>
                <div id="users" class="panel-collapse collapse in">
                        <div class="panel-body">
                                <div class="row">
                                        
                                                <?php $this->renderPartial('_form_user', array('model' => $user_model)) ?>
                                       
                                </div>
                        </div>
                </div>
        </div>
 </div>
        <div class="col-md-6">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Statutory Requirements') ?></h4>
                        </div>
                        <div class="panel-body">
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'nssf_no', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($staff_model, 'nssf_no', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($staff_model, 'nssf_no') ?>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'nhif_no', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($staff_model, 'nhif_no', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($staff_model, 'nhif_no') ?>
                                        </div>
                                </div>
                              
                               
                        </div>
                </div>
        </div>
        <div class="col-md-12">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Company Details') ?></h4>
                        </div>
                         
                        <div class="panel-body">
                            <div class="form-group">
                                <?php echo CHtml::activeLabelEx($staff_model, 'location_id', array('class' => 'col-md-2 control-label', 'label' => Lang::t('Office'))); ?>
                                <div class="col-md-4">
                                    <?php echo CHtml::activeDropDownList($staff_model, 'location_id', Location::model()->getListData('id', 'name', Lang::t('--Select Office--'), '`status`=:t1', array(':t1' => Location::STATUS_OPEN)), array('class' => 'form-control')); ?>
                                    <?php echo CHtml::error($staff_model, 'location_id') ?>
                                </div>
                            </div>   
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <?php echo CHtml::activeLabelEx($staff_model, 'dept_id', array('class' => 'col-md-2 control-label', 'label' => Lang::t('Department'))); ?>
                                <div class="col-md-4">
                                    <?php echo CHtml::activeDropDownList($staff_model, 'dept_id', Dept::model()->getListData('id', 'name', Lang::t('--Select Department--'), '`status`=:t1', array(':t1' => Dept::STATUS_OPEN)), array('class' => 'form-control')); ?>
                                 <?php echo CHtml::error($staff_model, 'dept_id') ?>
                                </div>
                            </div>   
                        </div>
                     <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($staff_model, 'level_id', array('class' => 'col-md-2 control-label' ,'label' => Lang::t('Staff Role'))); ?>
                                            <div class="col-md-4">                                       
                                             <?php echo CHtml::activeDropDownList($staff_model, 'level_id',  Level::model()->getListData('id', 'name', Lang::t('--Select Level--'),""), array('class' => 'form-control')); ?>
                                            <?php echo CHtml::error($staff_model, 'level_id') ?>
                                        </div>
                     </div>
                     <div id="person" class="panel-collapse collapse in">
                        <div class="panel-body">
                                 <div class="form-group">
                                        <div class="col-sm-7">
                                                <?php $this->renderPartial('application.views.person._image_field', array('model' => $model, 'htmlOptions' => array('field_class' => 'col-md-8'))) ?>
                                        </div>
                                </div>
                        </div>
                    </div>
                              
                               
                        </div>
                </div>
       

       



        <div class="col-md-12">
                <button class="btn btn-sm btn-primary" type="submit"><i class="icon-ok bigger-110"></i> <?php echo Lang::t($staff_model->isNewRecord ? 'Create Staff' : 'Save') ?></button>
                &nbsp; &nbsp; &nbsp;
                <a class="btn btn-sm" href="<?php echo Controller::getReturnUrl($staff_model->isNewRecord ? $this->createUrl('index') : $this->createUrl('view', array('id' => $staff_model->id))) ?>"><i class="icon-remove bigger-110"></i><?php echo Lang::t('Cancel') ?></a>
        </div>

<?php $this->endWidget(); ?>