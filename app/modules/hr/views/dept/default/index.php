<?php

$this->breadcrumbs = array(
    Lang::t("Human Resources") => "",
    $this->pageTitle,
);
?>
<?php $this->renderPartial('default/_grid', array('model' => $model)); ?>
