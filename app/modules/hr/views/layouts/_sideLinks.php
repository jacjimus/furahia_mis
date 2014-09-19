<?php if ($this->showLink(UserResources::RES_HR)): ?>
        <li  class="<?php echo $this->getModuleName() === 'hr' ? 'active open' : '' ?>">
                <a href="#" class="dropdown-toggle">
                        <i class="icon-group"></i>
                        <span class="menu-text"> <?php echo Lang::t('Human Resources') ?></span>
                         <b class="arrow icon-angle-down"></b>
                </a>
            <ul class="submenu">
                        <?php if ($this->showLink(UserResources::RES_USER_ROLES)): ?>
                                <li class="<?php echo $this->activeMenu === DeptModuleController::MENU_DEPT ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_HR . '/dept/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Manage Departments') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_USER_ADMIN)): ?>
                                <li class="<?php echo $this->activeMenu === HrModuleController::MENU_HR ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_HR . '/default/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Manage staff') ?></a></li>
                        <?php endif; ?>
                                
                        <?php if ($this->showLink(UserResources::RES_HR_LEAVE)): ?>
                                <li class="<?php echo $this->activeMenu === UsersModuleController::MENU_USER_RESOURCES ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl('users/resources/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Manage Staff Leave') ?></a></li>
                        <?php endif; ?>
                                
                        <?php if ($this->showLink(UserResources::RES_HR_WELFARE)): ?>
                                <li class="<?php echo $this->activeMenu === HrModuleController::MENU_WELFARE ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl('users/resources/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Staff Welfare') ?></a></li>
                        <?php endif; ?>
                                                
                        <?php if ($this->showLink(UserResources::RES_USER_LEVELS)): ?>
                                <li class="<?php echo $this->activeMenu === UsersModuleController::MENU_USER_LEVELS ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl('users/userLevels/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Staff Payroll') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_HR_REPORTS)): ?>
                                <li class="<?php echo $this->activeMenu === UsersModuleController::MENU_USER_LEVELS ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_HR . '/reports/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('HR Reports') ?></a></li>
                        <?php endif; ?>
                        
                </ul>
        </li>
<?php endif; ?>

