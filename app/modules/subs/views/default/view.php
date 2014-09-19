<?php
$this->breadcrumbs = array(
            "Products Details" => array(),
            "Subscribable Products" => 'index',
            $this->pageTitle => array(),
            
    );
    ?>
 <div class="col-sm-6">
<div class="panel panel-default">
        <div class="panel-heading">
                <h4 class="panel-title">
                        <i class="fa fa-chevron-down"></i> <a data-toggle="collapse" data-parent="#accordion" href="#account_info"><?php echo Lang::t('Product subscription details') ?></a>
                       
                </h4>
        </div>
        <div id="account_info" class="panel-collapse collapse in">
                <div class="panel-body">
                        <div class="detail-view">
                                <?php
                                $this->widget('application.components.widgets.DetailView', array(
                                    'data' => $model,
                                    'attributes' => array(
                                      
                                        array(
                                            'label' => Lang::t('Product Name'),
                                            'visible' => true,
                                            'value' => $sname,
                                            'type' => 'raw',
                                        ),
                                        array(
                                            'label' => Lang::t('Active Subs'),
                                            'visible' => true,
                                            'value' => number_format($active_subs , 0 , '.',','),
                                            'type' => 'raw',
                                        ),
                                        array(
                                            'label' => Lang::t('Inactive Subs'),
                                            'visible' => true,
                                            'value' => number_format($inactive_subs , 0 , '.',','),
                                            'type' => 'raw',
                                        ),
                                        
                                    ),
                                ));
                                ?>
                        </div>
                </div>
        </div>
</div>
 </div>