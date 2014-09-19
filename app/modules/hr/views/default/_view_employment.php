<div class="panel panel-default">
        <div class="panel-heading">
                <h4 class="panel-title">
                        <i class="fa fa-chevron-down"></i> <a data-toggle="collapse" data-parent="#accordion" href="#personal_info"><?php echo Lang::t('Employment Details') ?></a>
                        <?php if ($can_update || Users::isMyAccount($model->id)): ?>
                                <span><a class="pull-right" href="<?php echo $this->createUrl('view', array('id' => $model->id, 'action' => Users::ACTION_UPDATE_PERSONAL)) ?>"><i class="fa fa-edit"></i> <?php echo Lang::t('Edit') ?></a></span>
                        <?php endif; ?>
                </h4>
        </div>
        <div id="personal_info" class="panel-collapse collapse">
                <div class="panel-body">
                        <div class="detail-view">
                                <?php
                                $this->widget('application.components.widgets.DetailView', array(
                                    'data' => $model,
                                    'attributes' => array(
                                        array(
                                            'name' => 'staff_no',
                                        ),
                                        array(
                                            'name' => 'level',
                                        ),
                                        array(
                                            'name' => 'title',
                                        ),
                                        array(
                                            'name' => 'employment_date',
                                            'value' => Common::formatDate($model->employment_date, 'd M Y'),
                                            'visible' => !empty($model->employment_date),
                                        ),
                                        array(
                                            'name' => 'marriage_status',
                                        ),
                                        array(
                                            'name' => 'nssf_no',
                                        ),
                                        array(
                                            'name' => 'nhif_no',
                                        ),
                                        array(
                                            'name' => 'location',
                                        ),
                                         array(
                                            'name' => 'department',
                                        ),
                                        array(
                                            'name' => 'birthdate',
                                            'value' => Common::formatDate($model->birthdate, 'd M Y'),
                                            'visible' => !empty($model->birthdate),
                                        ),
                                        array(
                                            'name' => 'status',
                                            'value' => CHtml::tag('span', array('class' => $model->status === Staff::STATUS_ACTIVE ? 'badge badge-success' : 'badge badge-danger'), $model->status),
                                            'type' => 'raw',
                                        ),
                                         
                                    ),
                                ));
                                ?>
                        </div>
                </div>
        </div>
</div>
