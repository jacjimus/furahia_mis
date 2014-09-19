<?php
$grid_id = 'employee-grid';
$search_form_id = $grid_id . '-active-search-form';
?>
<!--grid header-->
<div class="row grid-view-header">
        <div class="col-sm-6">
                <div class="btn-group">
                        <?php if ($this->showLink($this->resource, Acl::ACTION_CREATE)): ?><a class="btn btn-sm" href="<?php echo $this->createUrl('create', $this->actionParams) ?>"><i class="icon-plus-sign"></i> <?php echo Lang::t('New Staff') ?></a><?php endif; ?>
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
$popup = 'function(){$("#perm-frame").attr("src",$(this).attr("href")); $("#dlg-perm-view").dialog("open");  return false;}';
$this->widget('application.components.widgets.GridView', array(
    'id' => $grid_id,
    'dataProvider' => $model->search(),
    'enablePagination' => $model->enablePagination,
    'enableSummary' => $model->enableSummary,
    'columns' => array(
        
        array(
            'name' => 'id_no',
            'type' => 'raw',
            'value' => 'CHtml::link(CHtml::encode($data->id_no),Yii::app()->controller->createUrl("view",array("id"=>$data->id)))',
        ),
        array(
            'name' => 'staff_no',
            'header' => "Staff NO",
            'type' => 'raw',
            'value' => 'CHtml::encode($data->staff_no)',
        ),
        array(
            'name' => 'name',
            'header' => "Names",
            'type' => 'raw',
            'value' => 'CHtml::encode($data->person)',
        ),
         array(
            'name' => 'name',
            'header' => "Office Location",
            'type' => 'raw',
            'value' => 'CHtml::encode($data->location)',
        ),
         array(
            'name' => 'dept_id',
            'header' => "Department",
            'type' => 'raw',
            'value' => 'CHtml::encode($data->department)',
        ),
        array(
            'name' => 'marriage_status',
            'type' => 'raw',
            'value' => '(CHtml::encode($data->marriage_status)=="Married")?'
            . '         CHtml::link(CHtml::encode($data->marriage_status),Yii::app()->controller->createUrl("details",array("id"=>$data->id)),array("title" => "View Spouse and Children Details"))'
            . ':CHtml::encode($data->marriage_status)',
            
        ),
        array(
            'class' => 'ButtonColumn',
            'template' => '{view}{update}{delete}',
            'buttons' => array(
                'view' => array(
                    'imageUrl' => false,
                    'label' => '<i class="icon-eye-open bigger-130"></i>',
                    'url' => 'Yii::app()->controller->createUrl("view",array("id"=>$data->primaryKey))',
                    'options' => array(
                        'class' => 'blue',
                        'title' => Lang::t('View details'),
                    ),
                ),
                'update' => array(
                    'imageUrl' => false,
                    'label' => '<i class="icon-pencil bigger-130"></i>',
                    'url' => 'Yii::app()->controller->createUrl("update",array("id"=>$data->primaryKey))',
                    'visible' => '$this->grid->owner->showLink("' . UserResources::RES_DEPT . '","' . Acl::ACTION_UPDATE . '")?true:false',
                    'options' => array(
                        'class' => 'green',
                        'title' => Lang::t('Edit'),
                    ),
                ),
                'delete' => array(
                    'imageUrl' => false,
                    'label' => '<i class="icon-trash bigger-130"></i>',
                    'url' => 'Yii::app()->controller->createUrl("delete",array("id"=>$data->primaryKey))',
                    'visible' => '$this->grid->owner->showLink("' . UserResources::RES_DEPT . '","' . Acl::ACTION_DELETE . '")&& $data->canDelete()?true:false',
                    'options' => array(
                        'class' => 'delete red',
                        'title' => Lang::t('Delete'),
                    ),
                ),
            )
        ),
    ),
));
?>
