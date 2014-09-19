  
<br />
<?php
 $this->widget('ext.mPrint.mPrint', array(
            'id' => 'mprint1',  // !!!you have to set up this one if you want multiple prints per page
            'title' => 'Print Logs',        //the title of the document. Defaults to the HTML title
            'tooltip' => 'testing the print',    //tooltip message of the print icon. Defaults to 'print'
            'text' => 'Print logs', //text which will appear beside the print icon. Defaults to NULL
            'element' => '#page',      //the element to be printed.
            'exceptions' => array(     //the element/s which will be ignored
                '.summary',
                '.search-form'
            ),
            'publishCss' => true       //publish the CSS for the whole page?
        ));

?> 
<br />
<br />
    <div id="page">
               <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" >
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('Subscription Logs') ?>
                                </a>
                        </h4>
                </div>
        <div id="users" class="panel-collapse collapse in">
                        <div class="panel-body">
                                <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <?php     $this->renderPartial('reports/_subs', array('model' => $searchModel)); ?>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
               <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" >
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('Keyword Logs') ?>
                                </a>
                        </h4>
                </div>
        <div id="users" class="panel-collapse collapse in">
                        <div class="panel-body">
                                <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <?php     $this->renderPartial('reports/_texts', array('model' => $textSmses)); ?>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
               <div class="panel panel-default">
                <div class="panel-heading">
                        <h4 class="panel-title">
                                <a data-toggle="collapse" >
                                        <i class="fa fa-chevron-down"></i> <?php echo Lang::t('Termination Logs') ?>
                                </a>
                        </h4>
                </div>
        <div id="users" class="panel-collapse collapse in">
                        <div class="panel-body">
                                <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <?php     $this->renderPartial('reports/_terms', array('model' => $terminations)); ?>
                                        </div>
                                </div>
                        </div>
                </div>
        </div>
              
   </div>         
