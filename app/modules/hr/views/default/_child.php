<div class=" grid-view-header">
<div class="col-sm-6">
                <div class="btn-group">
                        <?php if ($this->showLink($this->resource, Acl::ACTION_CREATE)): ?><a class="btn btn-sm" href="javascript:void(0)" onclick="
    
    {addChild(); $('#dialogChild').dialog('open');}"><i class="icon-plus-sign"></i> <?php echo Lang::t('Add Child') ?></a><?php endif; ?>
                </div>
        </div>
 

<div class="col-md-7">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                <h4 class="panel-title"><?php echo Lang::t('Children Details') ?></h4>
                        </div>
                        <div class="panel-body">
                            <?php
                            
$childModel = Child::model()->searchModel(array(), $this->settings[Constants::KEY_PAGINATION], 'name', "employee_id =  $id");
$this->widget('application.components.widgets.GridView', array(
    'id' => 'child-grid',
    'dataProvider' => $childModel->search(),
    'enablePagination' => $childModel->enablePagination,
    'enableSummary' => $childModel->enableSummary,
    'rowCssClassExpression' => '$data->status==="' . Child::STATUS_INACTIVE . '"?"bg-danger":""',
    'columns' => array(
        'name',
        'dob',
        'cert_no',
        
        ),
));
                              
           ?>                    
                        </div>
                </div>
        </div>
</div>
<?php
// Diaogue for adding new custom report
$this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
    'id' => 'dialogChild',
    'options' => array(
        'title' => 'Add Child',
        'autoOpen' => false,
        'modal' => false,
        'width' => 400,
        'height' => 300,
    ),
));
?>
<div class="divChild"></div>

<?php $this->endWidget(); ?>



<script type="text/javascript">
    // here is the magic
    function addChild()
    {
<?php
echo CHtml::ajax(array(
    'url' => array("add",'id'=>$id),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'success' => "function(data)
            {
                if (data.status == 'failure')
                {
                    $('#dialogChild div.divChild').html(data.div);
                          // Here is the trick: on submit-> once again this function!
                    $('#dialogChild div.divChild form').submit(addStaff);
                }
                else
                {
                    $('#dialogChild div.divChild').html(data.div);
                    setTimeout(\"$('#dialogChild').dialog('close') \",400);
                                         $('#child-grid').yiiGridView.update('child-grid'); 
                }
 
            } ",
))
?>;
        return false;

    }

</script>
