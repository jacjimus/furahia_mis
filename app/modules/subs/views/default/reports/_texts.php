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
            'name' => 'timestamp',
            'header' => 'Date/ Time Received',
            'value' => '$data->timestamp',
        ),
        array(
            'name' => 'dest_msisdn',
            'header' => 'Phone number',
        ),
        
        array(
            'name' => 'text_message',
            'header' => 'Keyword Received',
            
            'value' =>'$data->text_message',
        ),
        array(
            'name' => 'service_name',
            'header' => 'Service Name',
            
            'value' =>'$data->service_name',
        ),
        array(
            'name' => 'sender_name',
            'header' => 'Short Code',
            'type' => 'raw',
             'value' =>'$data->sender_name',
        
            ),
        
        
    ),
));
?>