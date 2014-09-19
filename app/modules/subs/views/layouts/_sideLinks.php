<?php if ($this->showLink(UserResources::RES_SUBS)): ?>
        <li  class="<?php echo $this->activeMenu === SubsModuleController::SUBS_MENU ? 'active' : '' ?> ">
                <a href="#" class="dropdown-toggle">
                        <i class="icon-phone-sign"></i>
                        <span class="menu-text"> <?php echo Lang::t('Subscriptions Module') ?></span>
                        <b class="arrow icon-angle-down"></b>
                </a>
            <ul class="submenu">
                        <?php if ($this->showLink(UserResources::RES_SUBS)): ?>
                                <li class="<?php echo $this->activeMenu === SubsModuleController::SUBS_MENU ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_SUBS . '/default/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Subscribable Products') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_SUBS_LOGS)): ?>
                                <li class="<?php echo $this->activeMenu === SubsModuleController::MENU_SUBS_LOGS ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_SUBS . '/default/logs') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Subsciption Logs') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_SUBS)): ?>
                                <li class="<?php echo $this->activeMenu ===  SubsModuleController::MENU_SCHED  ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_SUBS . '/default/schedules') ?> "><i class="icon-double-angle-right"></i><?php echo Lang::t('Broadcast Schedules') ?></a></li>
                        <?php endif; ?>
                        
                        
                        
            </ul>
        </li>
<?php endif; 


