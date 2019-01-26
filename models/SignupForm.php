<?php

namespace app\models;
use yii\base\Model;


class SignupForm extends Model{
    public $name;
    public $email;
    public $password;

    public function rules() {
        return [
            [['name', 'email', 'password'], 'required', 'message' => 'Заполните поле'],
            ['email', 'unique', 'targetClass' => User::className(),  'message' => 'Этот email уже занят']
        ];
    }

    public function attributeLabels() {
        return [
            'name' => 'Имя',
            'email' => 'Электронная почта',
            'password' => 'Пароль',
        ];
    }
}