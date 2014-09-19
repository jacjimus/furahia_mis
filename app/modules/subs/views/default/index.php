<?php

$this->breadcrumbs = array(
            "Products Details" => array(),
            "Subscribable Products" => array(),
            $this->pageTitle,
    );
$grid_id = 'service-grid';
$search_form_id = $grid_id . '-active-search-form';
?>
<!--grid header-->
<div class="row grid-view-header">
        <div class="col-sm-6">
                <div class="btn-group">
                        <?php if ($this->showLink($this->resource, Acl::ACTION_CREATE)): ?><?php endif; ?>
                </div>
        </div>
        <div class="col-sm-6">
                <div class="dataTables_filter">
                        <?php
                        $this->beginWidget('ext.activeSearch.AjaxSearch', array(
                            'gridID' => $grid_id,
                            'formID' => $search_form_id,
                            'model' => $model,
                            'action' => Yii::app()->createUrl($this->route, $this->actionParams),
                        ));
                        ?>
                        <?php $this->endWidget(); ?>
                </div>
        </div>
</div>
<?php
$this->widget('application.components.widgets.GridView', array(
    'id' => $grid_id,
    'dataProvider' => $model->search(),
    'enablePagination' => $model->enablePagination,
    'enableSummary' => $model->enableSummary,
    'rowCssClassExpression' => '$data->service_status==="' . Services::STATUS_CLOSED . '"?"bg-danger":""',
    'columns' => array(
        array(
            'name' => 'service_id',
            'type' => 'raw',
            'value' => 'CHtml::link(CHtml::encode($data->service_id),Yii::app()->controller->createUrl("view",array("id"=>$data->service_id)),array("title" => "View details"))',
        ),
        array(
            'name' => 'service_name',
            ),
        array(
            'name' => 'short_code',
        ),
        array(
            'name' => 'keyword',
        ),
        array(
            'name' => 'cost',
        ),
        array(
            'name' => 'timestamp',
        ),
        
        array(
            'name' => 'service_status',
            'type' => 'raw',
            'value' => 'CHtml::tag("span", array("class"=>$data->service_status==="' . Services::STATUS_ACTIVE . '"?"badge badge-success":"badge badge-danger"), $data->service_status)',
        ),
        array(
            'class' => 'ButtonColumn',
            'template' => '{view}',
            'buttons' => array(
                'view' => array(
                    'imageUrl' => false,
                    'label' => '<i class="icon-eye-open bigger-130"></i>',
                    'url' => 'Yii::app()->controller->createUrl("view",array("id"=>$data->service_id))',
                    'options' => array(
                        'class' => 'blue',
                        'title' => Lang::t('View details'),
                    ),
                ),
                
            )
        ),
    ),
));
?>
