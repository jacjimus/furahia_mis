<?php

        $this->breadcrumbs = array(
            'Profile details'
        );


$can_update = $user_model->canBeModified($this, Acl::ACTION_UPDATE);
$can_view_activity = $this->showLink(UserResources::RES_USER_ACTIVITY);
?>
<?php $this->renderPartial('_profile_tabs', array('model' => $user_model)); ?>
<div id="user-profile-1" class="user-profile row">
        <div class="col-xs-12 col-sm-3 center">
                <div>
                        <span class="profile-picture">
                                <?php echo CHtml::image(MyYiiUtils::getThumbSrc($person_model->getProfileImagePath(), array('resize' => array('width' => 200, 'height' => 200))), CHtml::encode($user_model->username), array('id' => 'avator', 'class' => 'editable img-responsive')); ?>
                        </span>
                        <div class="space-4"></div>
                        <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                <div class="inline position-relative">
                                        <a href="javascript:void(0);" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                                                <i class="icon-circle <?php echo $user_model->status === Users::STATUS_ACTIVE ? 'light-green' : ($user_model->status === Users::STATUS_PENDING ? 'yellow' : 'red') ?> middle"></i>
                                                &nbsp;
                                                <span class="white"><?php echo CHtml::encode($person_model->name) ?></span>
                                        </a>
                                </div>
                        </div>
                </div>
                <div class="space-6"></div>
                <div class="profile-contact-info">
                        <div class="profile-contact-links align-left">
                                <ul class="list-unstyled">
                                        <?php if (Users::isMyAccount($user_model->id)): ?>
                                                <li><a class="btn btn-link" href="<?php echo $this->createUrl('view', array('id' => $user_model->id, 'action' => Users::ACTION_CHANGE_PASSWORD)) ?>"><i class="fa fa-asterisk bigger-120 green"></i> <?php echo Lang::t('Change your password') ?></a></li>
                                        <?php endif; ?>
                                        <?php if ($can_update): ?>
                                                <li><a class="btn btn-link" href="<?php echo $this->createUrl('view', array('id' => $user_model->id, 'action' => Users::ACTION_RESET_PASSWORD)) ?>"><i class="fa fa-asterisk bigger-120 green"></i> <?php echo Lang::t('Reset Password') ?></a></li>
                                                <?php if ($user_model->status === Users::STATUS_ACTIVE): ?>
                                                        <li><button class="btn btn-link Users_changeStatus" type="button" data-ajax-url="<?php echo $this->createUrl('changeStatus', array('id' => $user_model->id, 'status' => Users::STATUS_BLOCKED)) ?>" ><i class="fa fa-minus-circle bigger-120 red"></i> <?php echo Lang::t('Block Account') ?></button></li>
                                                <?php else: ?>
                                                        <li><button class="btn btn-link Users_changeStatus" type="button" data-ajax-url="<?php echo $this->createUrl('changeStatus', array('id' => $user_model->id, 'status' => Users::STATUS_ACTIVE)) ?>"><i class="fa fa-check-circle bigger-120 blue"></i> <?php echo Lang::t('Activate Account') ?></button></li>
                                                <?php endif; ?>
                                        <?php endif; ?>
                                        <?php if ($can_view_activity): ?>
                                                <li class="hidden"><a class="btn btn-link" href="<?php echo $this->createUrl('activityLog', array('id' => $user_model->id)) ?>"><i class="fa fa-tasks bigger-120 green"></i> <?php echo Lang::t('System activities') ?></a></li>
                                        <?php endif; ?>
                                        <?php if (!Users::isMyAccount($user_model->id)): ?>
                                                <li class="hidden"><a class="btn btn-link show-colorbox" href="<?php echo Yii::app()->createUrl('msg/message/create', array('u_id' => $user_model->id, 'cb' => Yii::app()->createUrl($this->route, $this->actionParams))) ?>"><i class="icon-envelope bigger-120 green"></i> <?php echo Lang::t('Send a Message') ?></a></li>
                                        <?php endif; ?>
                                </ul>
                        </div>
                </div>
        </div>
        <div class="col-xs-12 col-sm-9">
                <?php if (empty($action)): ?>
                        <div class="panel-group" id="accordion">
                                <?php $this->renderPartial('_view_account', array('model' => $user_model, 'can_update' => $can_update)) ?>
                                <?php $this->renderPartial('_view_personal', array('model' => $person_model, 'can_update' => $can_update)) ?>
                                <?php $this->renderPartial('_view_address', array('model' => $address_model, 'can_update' => $can_update)) ?>
                        </div>
                <?php elseif ($action === Users::ACTION_UPDATE_PERSONAL): ?>
                        <?php $this->renderPartial('_update_personal', array('model' => $person_model)) ?>
                <?php elseif ($action === Users::ACTION_UPDATE_ACCOUNT): ?>
                        <?php $this->renderPartial('_update_account', array('model' => $user_model)) ?>
                <?php elseif ($action === Users::ACTION_UPDATE_ADDRESS): ?>
                        <?php $this->renderPartial('_update_address', array('model' => $address_model)) ?>
                <?php elseif ($action === Users::ACTION_RESET_PASSWORD): ?>
                        <?php $this->renderPartial('_reset_password', array('model' => $user_model)) ?>
                <?php elseif ($action === Users::ACTION_CHANGE_PASSWORD): ?>
                        <?php $this->renderPartial('_change_password', array('model' => $user_model)) ?>
                <?php endif; ?>
        </div>
</div>
<?php Yii::app()->clientScript->registerScript('users_' . $user_model->id, "MyController.Users.User.init();"); ?>