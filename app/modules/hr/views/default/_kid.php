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
                                <h4 class="panel-title"><?php echo Lang::t('Child Details') ?></h4>
                        </div>
                        <div class="panel-body">
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($child, 'name', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($child, 'name', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($child, 'name') ?>
                                        </div>
                                </div>
                            
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($child, 'dob', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($child, 'dob', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($child, 'dob') ?>
                                        </div>
                                </div>
                           
                                <div class="form-group">
                                        <?php echo CHtml::activeLabelEx($child, 'cert_no', array('class' => 'col-md-3 control-label')); ?>
                                        <div class="col-md-8">
                                                <?php echo CHtml::activeTextField($child, 'cert_no', array('class' => 'form-control')); ?>
                                                <?php echo CHtml::error($child, 'cert_no') ?>
                                        </div>
                                </div>
                              
         <div class="col-md-7">
            
                <button class="btn btn-sm btn-primary" type="submit"><i class="icon-ok bigger-110"></i> <?php echo Lang::t($child->isNewRecord ? 'Create Spouse' : 'Update') ?></button>
                &nbsp; &nbsp; &nbsp;
                <a class="btn btn-sm" href="<?php echo Controller::getReturnUrl($child->isNewRecord ? $this->createUrl('default/index') : $this->createUrl('default/index', array('id' => $child->id))) ?>"><i class="icon-remove bigger-110"></i><?php echo Lang::t('Cancel') ?></a>
        </div>
  
                        </div>
                </div>
        </div>
<?php $this->endWidget(); ?>