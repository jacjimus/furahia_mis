<?php if ($this->showLink(UserResources::RES_BULK)): ?>
        <li  class="<?php echo $this->getModuleName() === 'bulk' ? 'active open' : '' ?>">
                <a href="#" class="dropdown-toggle">
                        <i class="icon-comments"></i>
                        <span class="menu-text"> <?php echo Lang::t('Bulk Sms Module') ?></span>
                         <b class="arrow icon-angle-down"></b>
                </a>
            <ul class="submenu">
                        <?php if ($this->showLink(UserResources::RES_BULK_CUSTOME)): ?>
                                <li class="<?php echo $this->activeMenu === BulkModuleController::MENU_BULK_SEND ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_BULK . '/default/send') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Send Bulk Smes') ?></a></li>
                        <?php endif; ?>
                                
                        <?php if ($this->showLink(UserResources::RES_BULK_TEMPLATES)): ?>
                                <li class="<?php echo $this->activeMenu === BulkModuleController::MENU_BULK_TEMPLATE ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_BULK . '/default/template') ?>"><i class="icon-briefcase"></i><?php echo Lang::t('Manage Bulk Templates') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_USER_RESOURCES)): ?>
                                <li class="<?php echo $this->activeMenu === UsersModuleController::MENU_USER_RESOURCES ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl('users/resources/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Bulk Smses Reports') ?></a></li>
                        <?php endif; ?>
                        
                       
                        
                </ul>
        </li>
<?php endif; ?>

