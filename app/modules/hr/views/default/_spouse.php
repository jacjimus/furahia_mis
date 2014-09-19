<?php
$form = $this->beginWidget('CActiveForm', array(
    'id' => 'spouse-form',
    'enableAjaxValidation' => false,
    'htmlOptions' => array('class' => 'form-horizontal', 'enctype' => 'multipart/form-data', 'role' => 'form'),
        ));
?>
<div class="col-md-7">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Spouse Details') ?></h4>
                        </div>
                        <div class="panel-body">
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($spouse, 'spouse_name', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($spouse, 'spouse_name', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($spouse, 'spouse_name') ?>
                                        </div>
                                </div>
                            
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($spouse, 'spouse_age', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeHiddenField($spouse, 'employee_id', array('class' => 'form-control', 'value' => $id)); ?>
                                                <?php echo CHtml::activeTextField($spouse, 'spouse_age', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($spouse, 'spouse_age') ?>
                                        </div>
                                </div>
                           
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($spouse, 'spouse_idno', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($spouse, 'spouse_idno', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($spouse, 'spouse_idno') ?>
                                        </div>
                                </div>
                              
         <div class="col-md-7">
            
                <button class="btn btn-sm btn-primary" type="submit"><i class="icon-ok bigger-110"></i> <?php echo Lang::t($spouse->isNewRecord ? 'Create Spouse' : 'Update') ?></button>
                &nbsp; &nbsp; &nbsp;
                <a class="btn btn-sm" href="<?php echo Controller::getReturnUrl($spouse->isNewRecord ? $this->createUrl('default/index') : $this->createUrl('default/index', array('id' => $spouse->id))) ?>"><i class="icon-remove bigger-110"></i><?php echo Lang::t('Cancel') ?></a>
        </div>
  
                        </div>
                </div>
        </div>
<?php $this->endWidget(); ?>