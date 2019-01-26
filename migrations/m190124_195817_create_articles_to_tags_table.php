<?php

use yii\db\Migration;

/**
 * Handles the creation of table `articles_to_tags`.
 */
class m190124_195817_create_articles_to_tags_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('articles_to_tags', [
            'id' => $this->primaryKey(),
            'article_id' => $this->integer(),
            'tag_id' => $this->integer()
        ]);
        //create index for column 'user_id'
        $this->createIndex(
            'idx_tag_id',
            'articles_to_tags',
            'tag_id'
        );
        //add foreign key for table 'user'
        $this->addForeignKey(
            'fk_tag_id',
            'articles_to_tags',
            'tag_id',
            'tags',
            'id',
            'CASCADE'
        );
        //create index for column 'article_id'
        $this->createIndex(
            'tag_article-article_id',
            'articles_to_tags',
            'article_id'
        );
        //add foreign key for table 'article'
        $this->addForeignKey(
            'tag_article-article_id',
            'articles_to_tags',
            'article_id',
            'articles',
            'id',
            'CASCADE'
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('articles_to_tags');
    }
}
