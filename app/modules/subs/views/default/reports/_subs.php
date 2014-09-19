<?php
$grid_id = 'subs-grid';
$search_form_id = $grid_id . '-active-search-form';

$this->widget('application.components.widgets.GridView', array(
    'id' => $grid_id,
    'dataProvider' => $model->search(),
    'enablePagination' => false,
    'enableSummary' => $model->enableSummary,
     'columns' => array(
        
        array(
            'name' => 'sync_date',
            'value' => '$data->sync_date',
        ),
        array(
            'name' => 'service_name',
        ),
        array(
            'name' => 'msisdn',
        ),
        array(
            'name' => 'updatetype',
            'header' => 'Sub Type',
            'type' => 'raw',
            'value' =>'CHtml::tag("span", array("class"=>$data->updatetype == 1?"badge badge-success":"badge badge-danger"), $data->updatetype == 1 ?"Subscribed" : "Unsubscribed" )',
        ),
        array(
            'name' => 'auto_reply',
            'header' => 'Notified',
            'type' => 'raw',
             'value' =>'CHtml::tag("span", array("class"=>$data->auto_reply == 1?"badge badge-success":"badge badge-danger"), $data->auto_reply == 1 ?"Yes" : "No" )',
        
            ),
        
        
    ),
));
?>