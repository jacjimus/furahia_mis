<?php
$form_id = 'person-address-form';
$form = $this->beginWidget('CActiveForm', array(
    'id' => $form_id,
    'enableAjaxValidation' => false,
    'htmlOptions' => array('class' => 'form-horizontal', 'role' => 'form'),
        ));
?>
<div class="panel panel-default">
        <div class="panel-heading"><h3 class="panel-title"><?php echo Lang::t('Update Address Information') ?></h3></div>
        <div class="panel-body">
                <div class="row">
                        <div class="col-md-8 col-sm-12">
                                <?php $this->renderPartial('application.views.person._address_fields', array('model' => $model, 'label_size' => 3, 'input_size' => 8)) ?>
                        </div>
                </div>
        </div>
        <div class="panel-footer clearfix">
                <button class="btn btn-sm btn-primary" type="submit"><i class="icon-ok bigger-110"></i> <?php echo Lang::t('Save changes') ?></button>
                &nbsp; &nbsp; &nbsp;
                <a class="btn btn-sm" href="<?php echo Controller::getReturnUrl($this->createUrl('view', array('id' => $model->person_id))) ?>"><i class="icon-remove bigger-110"></i><?php echo Lang::t('Close') ?></a>
        </div>
</div>

<?php $this->endWidget(); ?>