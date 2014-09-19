<?php
/* @var $this SynchOrderController */

$this->breadcrumbs=array(
        'Reports' => '' , 
	'Subscriptions Reports',
);

?>

<div id="tabs">
<ul>
<li><a href="#tabs-1">Daily Report</a></li>
<li><a href="#tabs-4">Weekly Report</a></li>
<li><a href="#tabs-2">Monthly Report</a></li>
<li><a href="#tabs-3">Custom Report</a></li>

</ul>
<div id="tabs-1">

    
<?php 
$model = new Syncorder;

$start="";
$end="";


$form=$this->beginWidget('CActiveForm', array(
		'method'=>'post',
)); ?>
    <table style="width: 90%"><tr>
            <td style="width: 150px; padding: 5px 0px 5px 30px; ">

		<?php echo $form->label($model,'Select Date'); ?>
            </td>
<td style="width: 150px;">

    <?php



$this->widget('zii.widgets.jui.CJuiDatePicker', array(
	   'model' => $model,
            'attribute' => 'd_date',
            'options'=>array(
                'dateFormat' => 'yy-mm-dd',
                'showAnim'=>'fold',
                'changeMonth'=>true,
                'changeYear'=>true,
            ),
             'htmlOptions'=>array(
            'style'=>'width:150px;',
                 'value' => date("Y-m-d")
            
            ),
            ));


 ?>
 </td>
 
    

 <td style="width: 150px; padding: 0px 20px 0px 20px;">
           
             <?php echo $form->labelEx($model,'d_short_code'); ?>
        </td>
        <td style="width: 150px;">
            <?php
         $options = array();
            $sql = "SELECT DISTINCT short_code from sdp.sdp_services order by short_code";
            foreach (Yii::app()->db->createCommand($sql)->queryAll() as $row)
                $options[$row['short_code']] = $row['short_code'];

            echo $form->dropDownList($model, 'd_short_code', $options, array('empty' => 'All Shortcodes', 'style' => 'width:150px;'));
            ?>
<?php echo $form->error($model, 'd_short_code'); ?>
      
        </td>
        
         

 <td style="width: 150px; padding: 0px 20px 0px 20px;">
           
             <?php echo $form->labelEx($model,'d_status'); ?>
        </td>
        <td>
            <?php
         echo $form->dropDownList($model, 'd_status', array(1=>'Subscription', 2=> 'Un-Subscription'), array('empty' => '--Select--', 'style' => 'width:150px;','required' => true));
            ?>
<?php echo $form->error($model, 'd_status'); ?>
      
        </td>
        </tr>
        <tr>
            
            <td style="vertical-align: bottom; text-align: center" colspan="3">


                <div class="row buttons" style="padding: 5px 0px 5px 60px; " id="loading">
<?php echo CHtml::Button('Generate Report',array('id'=>'Daily','onclick'=>'getDailyReports()')); ?>
     </div>
 </td>
</tr>

</table>	
<?php $this->endWidget();?>
<div id="daily_reports">
<!--   Daily Reports will be displayed here after query :) :) :)-->
</div>


</div>
<div id="tabs-4">

    
<?php 

$start="";
$end="";


$form=$this->beginWidget('CActiveForm', array(
		'method'=>'post',
)); ?>
    <table style="width: 80%"><tr>
            <td style="width: 70px; padding: 5px 0px 5px 30px; ">

		<?php echo $form->label($model,'Start Date'); ?>
            </td>
<td style="width: 150px;">

    <?php



$this->widget('zii.widgets.jui.CJuiDatePicker', array(
	   'model' => $model,
            'attribute' => 'w_start',
            'options'=>array(
                'dateFormat' => 'yy-mm-dd',
                'showAnim'=>'fold',
                'changeMonth'=>true,
                'changeYear'=>true,
            ),
             'htmlOptions'=>array(
            'style'=>'width:100px;',
                 'value' => date("Y-m-d")
            
            ),
            ));


 ?>
 </td>
 
    
            <td style="width: 100px; padding: 5px 0px 5px 30px; ">

		<?php echo $form->label($model,'End Date'); ?>
            </td>
<td style="width: 150px;">

    <?php



$this->widget('zii.widgets.jui.CJuiDatePicker', array(
	   'model' => $model,
            'attribute' => 'w_end',
            'options'=>array(
                'dateFormat' => 'yy-mm-dd',
                'showAnim'=>'fold',
                'changeMonth'=>true,
                'changeYear'=>true,
            ),
             'htmlOptions'=>array(
            'style'=>'width:150px;',
                 'value' => date("Y-m-d")
            
            ),
            ));


 ?>
 </td>
 
    

 <td style="padding: 0px 20px 0px 20px;">
           
             <?php echo $form->labelEx($model,'w_short_code'); ?>
        </td>
        <td>
            <?php
         $options = array();
            $sql = "SELECT DISTINCT short_code from sdp.sdp_services order by short_code";
            foreach (Yii::app()->db->createCommand($sql)->queryAll() as $row)
                $options[$row['short_code']] = $row['short_code'];

            echo $form->dropDownList($model, 'w_short_code', $options, array('empty' => 'All Shortcodes', 'style' => 'width:150px;'));
            ?>
<?php echo $form->error($model, 'w_short_code'); ?> </td>
        <td style="width: 150px; padding: 0px 20px 0px 20px;">
           
             <?php echo $form->labelEx($model,'w_status'); ?>
        </td>
        <td>
            <?php
         echo $form->dropDownList($model, 'w_status', array(1=>'Subscription', 2=> 'Un-Subscription'), array('empty' => '--Select--', 'style' => 'width:150px;'));
            ?>
<?php echo $form->error($model, 'w_status'); ?>
      
        </td>
        </tr>
        <tr>
            <td style="vertical-align: bottom;" colspan="3">


     <div class="row buttons" style="padding: 5px 0px 5px 60px; ">
<?php echo CHtml::Button('Generate Report',array('id'=>'Weekly','onclick'=>'getWeeklyReports()')); ?></div>
 </td>
</tr>

</table>	
<?php $this->endWidget();?>
<div id="weekly_reports">
<!--   Daily Reports will be displayed here after query :) :) :)-->
  </div>


</div>
<div id="tabs-2">
<p>
    
    
<?php 


$start="";
$end="";


$form=$this->beginWidget('CActiveForm', array(
		'method'=>'post',
)); ?>
<table style="width: 90%">
    <tr>
<td><?php echo $form->label($model,'Year'); ?></td><td>

    <?php
    
    $last = date('Y') -2;
    $now = date('Y');
    $arr= array();

    for($i = $last;$i <= $now ;$i++)
    {
         $arr += array($i => $i);
    }
    //var_dump($arr);
echo $form->dropDownList($model,'year',CHtml::encodeArray($arr));
 ?></td>
<td>

		<?php echo $form->label($model,'month'); ?></td>

<td>

    <?php


echo $form->dropDownList($model,'month',CHtml::encodeArray(Yii::app()->locale->getMonthNames()));


 ?>
 </td>
 <td style="padding: 0px 20px 0px 20px;">
           
             <?php echo $form->labelEx($model,'m_short_code'); ?>
        </td>
        <td>
            <?php
         $options = array();
            $sql = "SELECT DISTINCT short_code from sdp.sdp_services order by short_code";
            foreach (Yii::app()->db->createCommand($sql)->queryAll() as $row)
                $options[$row['short_code']] = $row['short_code'];

            echo $form->dropDownList($model, 'm_short_code', $options, array('empty' => 'All Shortcodes', 'style' => 'width:150px;'));
            ?>
<?php echo $form->error($model, 'm_short_code'); ?> </td>
 <td>
  <?php echo $form->label($model,'sub'); ?></td>   
 </td>
 <td>
     <?php echo $form->dropDownList($model,'m_status',array(1 => 'Subscription', 2 => "Un-Subscription"))?>
 </td>
    </tr>
    <tr>
        <td></td>
        <td colspan="3" style="padding: 10px 20px 0px 20px;">


	<div class="row buttons">
<?php echo CHtml::Button('Generate Report',array('id'=>'Monthly','onclick'=>'getMonthlyReports()')); ?></div>
        </td>
</tr></table>	
<?php $this->endWidget(); ?>
<div id="monthly_reports">
<!--    Reports will be displayed here after query :) :) :)-->
  </div>
</p>
</div>
<div id="tabs-3">
    
    
    
<?php 

$form=$this->beginWidget('CActiveForm', array(
		'method'=>'post',
)); ?>
    <table style="width: 90%"><tr>
            <td style="width: 100px;"><?php echo $form->label($model,'Date From'); ?></td>
            <td  style="width: 150px;">

    <?php

$this->widget('zii.widgets.jui.CJuiDatePicker', array(
	   'model' => $model,
            'attribute' => 'c_start',
            'options'=>array(
                'dateFormat' => 'yy-mm-dd',
                'showAnim'=>'fold',
                'changeMonth'=>true,
                'changeYear'=>true,
            ),
            'htmlOptions'=>array(
            'style'=>'width:150px;',
           
            ),

            ));


 ?></td>
            <td style="width: 100px; padding: 5px 0px 5px 30px; ">

		<?php echo $form->label($model,'Date To'); ?>
            </td>
<td style="width: 150px;">

    <?php



$this->widget('zii.widgets.jui.CJuiDatePicker', array(
	   'model' => $model,
            'attribute' => 'c_end',
            'options'=>array(
                'dateFormat' => 'yy-mm-dd',
                'showAnim'=>'fold',
                'changeMonth'=>true,
                'changeYear'=>true,
            ),
             'htmlOptions'=>array(
            'style'=>'width:150px;',
                 'value' => date("Y-m-d")
            
            ),
            ));


 ?>
 </td>
 
 
             <td style="width: 100px; padding: 5px 0px 5px 0px; ">

            <br />
                <?php echo $form->labelEx($model,'report_name'); ?>
        </td>
        <td style="margin-top: 20px; " colspan="3">
            <br />
                <?php //echo $form->ListBox($model,'skillid',array('id'=>'Select a Skill')); ?>
            <?php echo $form->dropDownList($model,'report_name', 
  CHtml::listData(Report::model()->findAll(array('order'=>'name')), 'id', 'name'),array('style' => 'width: 200px;'));
?>
                <?php echo $form->error($model,'report_name'); ?>
      
        </td>
        <td>
  <?php echo $form->label($model,'c_status'); ?></td>   
 </td>
 <td>
     <?php echo $form->dropDownList($model,'c_status',array(1 => 'Subscription', 2 => "Un-Subscription"))?>
 </td>
 </tr>
 <tr>
     <td></td>
     <td style="padding: 20px 0px 5px 60px;" colspan="3">
        

     <div class="row buttons" style="padding: 5px 0px 5px 60px; ">
<?php echo CHtml::Button('Generate Report',array('id'=>'Custom','onclick'=>'getCustomReports()')); ?></div></td>
</tr>

</table>	
<?php $this->endWidget();?>
<div id="custome_reports">
<!--   Daily Reports will be displayed here after query :) :) :)-->
  </div>


</div>
    
</div>


 <?php $this->renderPartial('ajax/sync') ?>

