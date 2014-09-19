<?php
$this->breadcrumbs = array(
    Lang::t(Common::pluralize($this->resourceLabel)) => array('index'),
    $this->pageTitle,
);
?>

        <?php $this->renderPartial('_spouse', array('spouse' => $spouse, 'id' => $id)) ?>
        <?php $this->renderPartial('_child', array('id' => $id)) ?>
        
