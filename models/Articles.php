<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\behaviors\SluggableBehavior;
use yii\helpers\StringHelper;
use yii\web\UploadedFile;

/**
 * This is the model class for table "articles".
 *
 * @property int $id
 * @property string $title
 * @property string $description
 * @property string $text
 * @property string $date
 * @property string $image
 * @property int $user_id
 *
 * @property ArticlesToTags[] $articlesToTags
 */
class Articles extends \yii\db\ActiveRecord
{
    /*
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
                'value' => new Expression('NOW()'),
            ],
            /*
            [
                'class' => SluggableBehavior::className(),
                'attribute' => 'title'
            ],

        ];
    }
*/
    public $imageFile;

    /**
     *
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'articles';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'description', 'text'], 'required'],
            [['description', 'text'], 'string'],
            [['imageFile'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg, jpeg'],
            [['date'], 'date', 'format' => 'php:Y-m-d H:i:s'],
            [['date'], 'default', 'value' => date('Y-m-d H:i:s')],
            [['user_id'], 'integer'],
            [['title', 'image'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'description' => 'Description',
            'text' => 'Text',
            'date' => 'Date',
            'image' => 'Image',
            'user_id' => 'User ID',
        ];
    }

    public function uploadAndSave () {
        if ($this->validate()) {
            if (isset($this->imageFile)) {
                $this->image = 'uploads/' . $this->imageFile->baseName . '.' . $this->imageFile->extension;
                $this->imageFile->saveAs($this->image);
            }
            return $this->save(false);
        }
        return false;
    }

    public function getPreview () {
        $words = 60;
        if (StringHelper::countWords($this->text) > $words) {
            return StringHelper::truncateWords($this->text, $words);
        } else {
            return $this->text;
        }
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticlesToTags()
    {
        return $this->hasMany(ArticlesToTags::className(), ['article_id' => 'id']);
    }

    /**
     * {@inheritdoc}
     * @return ArticlesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ArticlesQuery(get_called_class());
    }
}
