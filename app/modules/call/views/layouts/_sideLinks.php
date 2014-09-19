<?php if ($this->showLink(UserResources::RES_CALL_MANAGER)): ?>
        <li  class="<?php echo $this->getModuleName() === 'call' ? 'active open' : '' ?>">
                <a href="#" class="dropdown-toggle">
                        <i class="icon-phone-sign"></i>
                        <span class="menu-text"> <?php echo Lang::t('Calls Manager Module') ?></span>
                         <b class="arrow icon-angle-down"></b>
                </a>
            <ul class="submenu">
                        <?php if ($this->showLink(UserResources::RES_CALL_NEW)): ?>
                                <li class="<?php echo $this->activeMenu === CallModuleController::MENU_NEW ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_CALL . '/default/new') ?>"><i class="icon-mail-forward"></i><?php echo Lang::t('New Call') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_CALL_WAITING)): ?>
                                <li class="<?php echo $this->activeMenu === CallModuleController::MENU_WAITING ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_CALL . '/default/waiting') ?>"><i class="icon-envelope"></i><?php echo Lang::t('Waiting Calls') ?></a></li>
                        <?php endif; ?>
                                
                        <?php if ($this->showLink(UserResources::RES_CALL_PROCESSED)): ?>
                                <li class="<?php echo $this->activeMenu === CallModuleController::MENU_PROCESSED ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_CALL . '/default/processed') ?>"><i class="icon-archive"></i><?php echo Lang::t('Processed Calls') ?></a></li>
                        <?php endif; ?>
                                
                        <?php if ($this->showLink(UserResources::RES_CALL_ESCALATED)): ?>
                                <li class="<?php echo $this->activeMenu === CallModuleController::MENU_ESACALED ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_CALL . '/default/escalated') ?>"><i class="icon-fast-forward"></i><?php echo Lang::t('Escalated Calls') ?></a></li>
                        <?php endif; ?>
                                                
                        
                        <?php if ($this->showLink(UserResources::RES_CALL_REPORTS)): ?>
                                <li class="<?php echo $this->activeMenu === CallModuleController::MENU_REPORTS ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_CALL . '/default/reports') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Calls Reports') ?></a></li>
                        <?php endif; ?>
                        
                </ul>
        </li>
<?php endif; ?>
