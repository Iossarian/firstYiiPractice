<?php

/* @var $model \app\models\Post */

use yii\helpers\Url;
use yii\bootstrap\Html;
?>
<div class="align">
<div class="col-md-4">
    <div class="panel panel-default">
        <div class="panel-body">
            <h2 class="truncate text-center"><?=Html::a($model->title, ['article/view', 'id' => $model->id])?></h2>
            <hr>
            <?php if (isset($model->image)) { ?>
                <div class="post-image img-rounded">
                    <img STYLE="width: 100%" src="../<?=$model->image?>" alt="картинка">
                </div>
            <?php } ?>
            <hr>
            <p><?=$model->description;?></p>
            <hr>
            <div class="text-right">
                <p><span class="badge"><?= Yii::$app->formatter->asRelativeTime($model->date)?> ago</span></p>
            </div>
        </div>
    </div>
</div>
</div>