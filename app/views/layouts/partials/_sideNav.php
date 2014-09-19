<div class="sidebar sidebar-fixed<?php echo $this->sidebar_collapsed ? ' menu-min' : '' ?>" id="sidebar">
        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                        <a class="btn btn-success" href="<?php echo Yii::app()->createUrl('hr/default/index') ?>" title="Parking"><i class="icon-truck"></i></a>
                        <a class="btn btn-warning" href="<?php echo Yii::app()->createUrl('users/default/view') ?>" title="Profile"><i class="icon-user"></i></a>
                        <a class="btn btn-danger" href="<?php echo Yii::app()->createUrl('settings/default/index') ?>" title="Settings"><i class="icon-wrench"></i></a>
                </div>
                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                        <span class="btn btn-success"></span>
                        <span class="btn btn-info"></span>
                        <span class="btn btn-warning"></span>
                        <span class="btn btn-danger"></span>
                </div>
        </div><!-- #sidebar-shortcuts -->
        <ul class="nav nav-list my-nav">
            <li class="<?php echo $this->getModuleName() === 'admin' ? 'active open' : '' ?>"><a href="<?php echo Yii::app()->createUrl('admin/default/index') ?>" class=" dropdown-toggle">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> <?php echo Lang::t('Home') ?> </span>
                    <b class="arrow icon-angle-down"></b>
                    </a>
                     <ul class="submenu">
                       <li class="<?php echo $this->activeMenu === AdminModuleController::MENU_DASHBOARD ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl('admin/default/index') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Dashboard') ?></a></li>
                       </ul>  
                     <ul class="submenu">
                       <li class="<?php echo $this->activeMenu === AdminModuleController::MENU_PROFILE ? 'active' : '' ?>"><a href="<?php echo Yii::app()->createUrl('admin/default/profile') ?>"><i class="icon-double-angle-right"></i><?php echo Lang::t('Profile details') ?></a></li>
                       </ul>  
                </li>
                <!--SUBSCRIPTION MODULE-->
                
                 <?php
                 
                if (Controller::isModuleEnabled(ModulesEnabled::MOD_SUBS)):
                        $this->renderPartial(ModulesEnabled::MOD_SUBS . '.views.layouts._sideLinks');
                endif;
                ?>
                <!--BULK SMS MODULE-->
                 <?php
                if (Controller::isModuleEnabled(ModulesEnabled::MOD_BULK)):
                        $this->renderPartial(ModulesEnabled::MOD_BULK . '.views.layouts._sideLinks');
                endif;
                ?>
                <!--HR MODULE-->
                 <?php
                if (Controller::isModuleEnabled(ModulesEnabled::MOD_HR)):
                        $this->renderPartial(ModulesEnabled::MOD_HR . '.views.layouts._sideLinks');
                endif;
                ?>
                <!--CALLS MANAGER MODULE-->
                 <?php
                if (Controller::isModuleEnabled(ModulesEnabled::MOD_CALL)):
                        $this->renderPartial(ModulesEnabled::MOD_CALL . '.views.layouts._sideLinks');
                endif;
                ?>
                <!--REPORTS MODULE-->
               <?php
                if (Controller::isModuleEnabled(ModulesEnabled::MOD_REPORTS)):
                        $this->renderPartial(ModulesEnabled::MOD_REPORTS . '.views.layouts._sideLinks');
                endif;
                ?>
                <?php
                if ($this->showLink(UserResources::RES_USER_ADMIN)):
                        $this->renderPartial('users.views.layouts._sideLinks');
                endif;
                ?>
                <?php $this->renderPartial('settings.views.layouts._sideLinks'); ?>
        </ul><!-- /.nav-list -->

        <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
        </div>
</div>