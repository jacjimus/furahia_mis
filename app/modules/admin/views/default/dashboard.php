
<div class="col-md-12">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Monthly ('.date('M').') Performance Summary') ?></h4>
                        </div>
                         
                        <div class="panel-body">
                            
                             <?php      
                           $this->widget('ext.fusioncharts.fusionChartsWidget', array('debugMode' => false,
                                                              'chartType' => 'StackedColumn3D',
                                                              'chartWidth' => '1200',
                                                              'chartHeight' => '700',
                                                              
                                                              'chartNoCache'=>true, // disabling chart cache
                                                              'chartAction'=> CHtml::encode(Yii::app()->urlManager->createUrl('admin/default/monthly_term')), // the chart action that we just generated the x
                                                              'chartId'=>'monthly_terms')); // If you display more then one chart on a single page then make sure you specify and id

 ?>
                        </div>
                    </div>
                              
                               
                        </div>
<div class="col-md-6">
                <div class="panel panel-default ">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Personal details') ?></h4>
                        </div>
                        <div class="panel-body">
                          <?php      
                           $this->widget('ext.fusioncharts.fusionChartsWidget', array(   'debugMode' => false,
                                                              'chartType' => 'MSColumn3D',
                                                              'chartNoCache'=>true, // disabling chart cache
                                                              'chartAction'=> CHtml::encode(Yii::app()->urlManager->createUrl('admin/default/chart')), // the chart action that we just generated the x
                                                              'chartId'=>'course1_load')); // If you display more then one chart on a single page then make sure you specify and id

 ?>
                        </div>
                </div>
        </div>
 <div class="col-md-6">
 <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#users">
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('Account details') ?>
                                </a>
                        </h4>
                </div>
                <div id="users" class="panel-collapse collapse in">
                        <div class="panel-body">
                                 <?php      
                           $this->widget('ext.fusioncharts.fusionChartsWidget', array(   'debugMode' => false,
                                                              'chartType' => 'MSColumn3D',
                                                              'chartNoCache'=>true, // disabling chart cache
                                                              'chartAction'=> CHtml::encode(Yii::app()->urlManager->createUrl('admin/default/chart')), // the chart action that we just generated the x
                                                              'chartId'=>'course_load2')); // If you display more then one chart on a single page then make sure you specify and id

 ?>
                        </div>
                </div>
        </div>
 </div>
        <div class="col-md-6">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Statutory Requirements') ?></h4>
                        </div>
                        <div class="panel-body">
                                 <?php      
                           $this->widget('ext.fusioncharts.fusionChartsWidget', array(   'debugMode' => false,
                                                              'chartType' => 'MSColumn3D',
                                                              'chartNoCache'=>true, // disabling chart cache
                                                              'chartAction'=> CHtml::encode(Yii::app()->urlManager->createUrl('admin/default/chart')), // the chart action that we just generated the x
                                                              'chartId'=>'course_load3')); // If you display more then one chart on a single page then make sure you specify and id

 ?>
                              
                               
                        </div>
                </div>
        </div>
        
              
       

       


