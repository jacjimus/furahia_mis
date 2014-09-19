<?php

$this->breadcrumbs = array(
           "Subscribable Products" => array(),
            $this->pageTitle,
    );


$form_id = 'logs-form';
$form = $this->beginWidget('CActiveForm', array(
    'id' => $form_id,
    'enableAjaxValidation' => false,
    'htmlOptions' => array('class' => 'form-horizontal', 'enctype' => 'multipart/form-data', 'role' => 'form'),
        ));
$label_class = "col-md-3 control-label";
$input_class = "col-md-4";

?>

 <div class="col-md-7">
 <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#users">
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('<i>Find customer subscription Logs</i>') ?>
                                </a>
                        </h4>
                </div>
     <div id="users" class="panel-collapse collapse in">
         <div class="panel-body">
             <div class="row">
                 <div class="form-group">
                     <?php echo CHtml::activeLabelEx($model, 'Phone Number ', array('class' => $label_class)); ?>
                     
                     <div class="<?php echo $input_class ?>">
                         <em>e.g 254722000000</em>
                         <?php echo CHtml::activeTextField($model, 'msisdn', array('class' => 'form-control', 'maxlength' => 12, 'type' => 'text')); ?>
                         <?php echo CHtml::error($model, 'msisdn') ?>
                     </div>
                 </div>
             </div>
         </div>
    
    
         <div class="form-group" style="padding-left: 15%;">
        <div class="col-md-12">
                <button class="btn btn-sm btn-primary" type="submit"><i class="icon-ok bigger-110"></i> <?php echo Lang::t('Find logs') ?></button>
                &nbsp; &nbsp; &nbsp;
                <a class="btn btn-sm" href="<?php echo Controller::getReturnUrl($this->createUrl('index')) ?>"><i class="icon-remove bigger-110"></i><?php echo Lang::t('Cancel') ?></a>
        </div>
 </div> 
          </div>
        </div>
 </div>
<?php $this->endWidget(); 
?>
<div class="col-md-12">

<?php
if (Yii::app()->request->isPostRequest) {
                $searchModel = new Subs();
                $subs_model_class_name = $searchModel->getClassName();
               $client = $_POST[$subs_model_class_name]['msisdn'];
               $cond = "msisdn = '$client'";
               $searchModel = Subs::model()->searchModel(array(), 100, 'sync_date' , $cond);
               if(!empty($searchModel))
               {
                
               $service_id = $searchModel->serviceid;
               $search = " dest_msisdn = '$client' ";
               $textSmses = Incoming::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'timestamp' , $search);
               $terminations = Terminations::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'timestamp' , $search);
                
               $this->renderPartial('repos',
                       array(
                           'searchModel' => $searchModel,
                           'textSmses' => $textSmses,
                           'terminations' => $terminations
                       ));
               
               }
}
               ?>
  
        
    
</div>
    

