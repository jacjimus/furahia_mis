<?php
if (!isset($label_size)):
        $label_size = 2;
endif;
if (!isset($input_size)):
        $input_size = 10;
endif;
$label_class = "col-md-{$label_size} control-label";
$input_class = "col-md-{$input_size}";
$half_input_size = $input_size / 2;
$half_input_class = "col-md-{$half_input_size}";
?>
<div class="">
        <label class="<?php echo $label_class ?>"><?php echo Lang::t('Name') ?><span class="required">*</span></label>
        <div class="<?php echo $half_input_class ?>">
                <?php echo CHtml::activeTextField($model, 'first_name', array('class' => 'form-control', 'maxlength' => 30, 'placeholder' => $model->getAttributeLabel('first_name'))); ?>
                <?php echo CHtml::error($model, 'first_name') ?>
        </div>
        <div class="<?php echo $half_input_class ?>">
                <?php echo CHtml::activeTextField($model, 'last_name', array('class' => 'form-control', 'maxlength' => 30, 'placeholder' => $model->getAttributeLabel('last_name'))); ?>
                <?php echo CHtml::error($model, 'last_name') ?>
        </div>
</div>


