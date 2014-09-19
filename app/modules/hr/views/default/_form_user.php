<?php
if (!isset($label_size)):
        $label_size = 3;
endif;
if (!isset($input_size)):
        $input_size = 8;
endif;
$label_class = "col-md-{$label_size} control-label";
$input_class = "col-md-{$input_size}";
?>
<div class="form-group">
        <?php echo CHtml::activeLabelEx($model, 'email', array('class' => $label_class)); ?>
        <div class="<?php echo $input_class ?>">
                <?php echo CHtml::activeEmailField($model, 'email', array('class' => 'form-control', 'maxlength' => 128, 'type' => 'email')); ?>
                <?php echo CHtml::error($model, 'email') ?>
        </div>
</div>
<?php if ($model->isNewRecord): ?>
        <div class="form-group">
                <?php echo CHtml::activeLabelEx($model, 'username', array('class' => $label_class)); ?>
                <div class="<?php echo $input_class ?>">
                        <?php echo CHtml::activeTextField($model, 'username', array('class' => 'form-control', 'maxlength' => 30)); ?>
                        <?php echo CHtml::error($model, 'username') ?>
                </div>
        </div>
<?php endif; ?>
<?php if ($model->isNewRecord): ?>
        <div class="form-group">
                <?php echo CHtml::activeLabelEx($model, 'password', array('class' => $label_class)); ?>
                <div class="<?php echo $input_class; ?>">
                        <?php echo CHtml::activePasswordField($model, 'password', array('class' => 'form-control')); ?>
                        <?php echo CHtml::error($model, 'password') ?>
                </div>
        </div>
        <div class="form-group">
                <?php echo CHtml::activeLabelEx($model, 'confirm', array('class' => $label_class)); ?>
                <div class="<?php echo $input_class; ?>">
                        <?php echo CHtml::activePasswordField($model, 'confirm', array('class' => 'form-control')); ?>
                        <?php echo CHtml::error($model, 'confirm') ?>
                </div>
        </div>
<?php endif; 
$can_update = $this->showLink(Users::USER_RESOURCE_PREFIX . $model->user_level, Acl::ACTION_UPDATE) && !Users::isMyAccount($model->id);

?>
<?php if ($model->getIsNewRecord() || $can_update) : 
    ?>
 <div class="form-group">
                <?php echo CHtml::activeLabelEx($model, 'user_level', array('class' => $label_class)); ?>
                <div class="<?php echo $input_class ?>">
                        <?php echo CHtml::activeDropDownList($model, 'user_level', Users::model()->getUserLevels($this), array('class' => 'form-control', 'data-show-role' => UserLevels::LEVEL_ADMIN)); ?>
                    <?php echo CHtml::error($model, 'user_level') ?>
                </div>
        </div>
<?php
endif;
?>
<div class="form-group">
        <?php echo CHtml::activeLabelEx($model, 'timezone', array('class' => $label_class)); ?>
        <div class="<?php echo $input_class; ?>">
                <?php echo CHtml::activeDropDownList($model, 'timezone', SettingsTimezone::model()->getListData('name', 'name'), array('class' => 'form-control')); ?>
        </div>
</div>
<?php if ($model->isNewRecord): ?>
        <div class="form-group">
                <div class="col-md-offset-<?php echo $label_size ?> <?php echo $input_class; ?>">
                        <label class="checkbox"><?php echo CHtml::activeCheckBox($model, 'send_email'); ?> <?php echo Lang::t('Email the login details to the user.') ?></label>
                </div>
        </div>
<?php endif; ?>
