<?php

use yii\db\Migration;

/**
 * Handles the creation of table `articles`.
 */
class m190124_195359_create_articles_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('articles', [
            'id' => $this->primaryKey(),
            'title' => $this->string(),
            'description'  => $this->text(),
            'text'  => $this->text(),
            'date'  => $this->date(),
            'image'  => $this->string(),
            'user_id'  => $this->integer()
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('articles');
    }
}
