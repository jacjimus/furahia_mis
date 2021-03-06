<?php
$form_id = 'users-form';
$form = $this->beginWidget('CActiveForm', array(
    'id' => $form_id,
    'enableAjaxValidation' => false,
    'htmlOptions' => array('class' => 'form-horizontal', 'enctype' => 'multipart/form-data', 'role' => 'form'),
        ));
?>
<div class="panel-group" id="accordion">
    <div class="col-md-7">
 <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#users">
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('Account Details') ?>
                                </a>
                        </h4>
                </div>
        <div id="users" class="panel-collapse collapse in">
                        <div class="panel-body">
                                <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                                <?php $this->renderPartial('_form_user', array('model' => $user_model)) ?>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
    
       
 </div>

    <div class="col-md-5">
 <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#users">
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('Personal Details') ?>
                                </a>
                        </h4>
                </div>
     <div id="person" class="panel-collapse collapse in">
                        <div class="panel-body">
                                 <div class="form-group">
                                        <div class="col-sm-10">
                                                <?php $this->renderPartial('application.views.person._image_field', array('model' => $person_model, 'htmlOptions' => array('field_class' => 'col-md-9'))) ?>
                                        </div>
                                </div>
                        </div>
    </div>
     <div id="person" class="panel-collapse collapse in">
                        <div class="panel-body">
                                <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                                <?php $this->renderPartial('application.views.person._form_fields', array('model' => $person_model)) ?>
                                        </div>
                                </div>
                        </div>
                </div>
 </div>
   
<br />
<br />
<br />


<div class="form-group">
        <div class="col-md-12">
                <button class="btn btn-sm btn-primary" type="submit"><i class="icon-ok bigger-110"></i> <?php echo Lang::t($user_model->isNewRecord ? 'Create' : 'Save changes') ?></button>
                &nbsp; &nbsp; &nbsp;
                <a class="btn btn-sm" href="<?php echo Controller::getReturnUrl($this->createUrl('index')) ?>"><i class="icon-remove bigger-110"></i><?php echo Lang::t('Cancel') ?></a>
        </div>
 </div>
    </div>
<?php $this->endWidget(); ?>
