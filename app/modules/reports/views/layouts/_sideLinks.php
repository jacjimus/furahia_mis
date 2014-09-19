<?php if ($this->showLink(UserResources::RES_REPORTS)): ?>
       <li  class="<?php echo $this->getModuleName() === 'reports' ? 'active open' : '' ?>">
                <a href="#" class="dropdown-toggle">
                        <i class="icon-bar-chart"></i>
                        <span class="menu-text"> <?php echo Lang::t('Reports Module') ?></span>
                        <b class="arrow icon-angle-down"></b>
                </a>
             <ul class="submenu">
                        
                        <?php if ($this->showLink(UserResources::RES_REPORTS_SUB)): ?>
                 <li class="<?php echo $this->activeMenu === ReportsModuleController::MENU_SUBS ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_REPORTS.'/default/sub') ?>"><i class="icon-bar-chart"></i><?php echo Lang::t('Subs Reports') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_REPORTS_TERM)): ?>
                                <li class="<?php echo $this->activeMenu === ReportsModuleController::MENU_TERM ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_REPORTS.'/default/term') ?>"><i class="icon-bar-chart"></i><?php echo Lang::t('Termination Reports') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_REPORTS_PARTNERS)): ?>
                                <li class="<?php echo $this->activeMenu === ReportsModuleController::MENU_PARTNER ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_REPORTS.'/default/partner') ?>"><i class="icon-bar-chart"></i><?php echo Lang::t('Partners Reports') ?></a></li>
                        <?php endif; ?>
                        <?php if ($this->showLink(UserResources::RES_REPORTS_SETUP)): ?>
                                <li class="<?php echo $this->activeMenu === ReportsModuleController::MENU_SETUP ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl(ModulesEnabled::MOD_REPORTS.'/default/setup') ?>"><i class="icon-gears"></i><?php echo Lang::t('Reports Setup') ?></a></li>
                        <?php endif; ?>
                        
                        
                </ul>
        </li>
<?php endif; ?>

