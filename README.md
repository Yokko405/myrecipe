# マイレシピアプリ

## アプリケーション概要
マイレシピアプリは、レシピとそのレシピに含まれる栄養素を3色食品群から選択して登録することで、
不足している栄養素のレシピを提案するアプリです。

## URL
https://myrecipe-9een.onrender.com/

## テスト用アカウント
- ユーザー名: `admin`
- パスワード: `skr1234`

## 利用方法
1. アカウントを作成し、ログインします。
2. 「レシピ追加」から新しいレシピとその栄養素を登録します。
3. 登録したレシピから、不足している栄養素を分析し、それを補うレシピを提案します。

## アプリケーションを作成した背景
健康志向が高まる中、自炊する人が増えています。しかし、栄養バランスの知識が不足していると、健康的な食生活を送ることが困難です。このアプリは、そんなユーザーの栄養バランスをサポートし、より健康的な食生活を送る手助けをします。

## 実装した機能
- レシピ投稿機能
- 栄養素に基づいたレシピ提案機能
- ユーザー登録・ログイン機能

## アプリケーションのスクリーンショット
[![Image from Gyazo](https://i.gyazo.com/9f866fa3a8c9013d0068fb6023dbcd17.png)](https://gyazo.com/9f866fa3a8c9013d0068fb6023dbcd17)

## 実装予定の機能
- レシピに対するユーザーの評価機能
- 栄養素に関する詳細情報の表示

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/fd7bebaf4bec6f5e826ae433ab6bafe6.png)](https://gyazo.com/fd7bebaf4bec6f5e826ae433ab6bafe6)


### Usersテーブル

| Column          | Type   | Options                   |
|-----------------|--------|---------------------------|
| email           | string | null: false, unique: true |
| password_digest | string | null: false               |
| username        | string | null: false               |

#### アソシエーション
- has_many :recipes

### Recipesテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user_id     | references | null: false, foreign_key: true |
| title       | string     | null: false, length: { maximum: 255 }                    |
| description | text       |                                |
| instructions| text       | null: false                    |
| color_group_id,| integer       |                                |

#### アソシエーション
- belongs_to :user
- has_many :ingredients

### Active Storage
このアプリケーションでは、画像のアップロードにはActive Storageを使用します。
Active Storageの設定を適切に行うことで、画像は自動的に関連付けられ、管理されます。

### Ingredientsテーブル

| Column | Type   | Options     |
|--------|--------|-------------|
| name   | string | null: false |
| quantity   | string | null: false |
| color_group_id,| integer       |

#### アソシエーション
- belongs_to :recipe



## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/e4057b9700fe4c392d7a5d6774660f9b.png)](https://gyazo.com/e4057b9700fe4c392d7a5d6774660f9b)

## 開発環境
- 言語: Ruby, JavaScript
- フレームワーク: Ruby on Rails
- フロントエンド: HTML, CSS
- データベース: SQLite (開発), PostgreSQL (本番)

## ローカルでの動作方法
以下のコマンドをターミナルで実行して、アプリケーションをセットアップします：
$ git clone [リポジトリURL]
$ cd マイレシピアプリ
$ bundle install
$ yarn install
$ rails db:create db:migrate db:seed
$ rails server


## 工夫したポイント
- ユーザーの栄養バランスを視覚化し、不足栄養素を直感的に理解できるデザインを採用。
- 栄養バランスに基づいたレシピ提案機能を実装し、ユーザーの食生活の改善をサポート。

## 改善点
- レシピの検索機能をより詳細にして、ユーザーが求めるレシピを容易に見つけられるようにする。
- 栄養素のデータベースを拡充して、より多様な栄養バランスの提案を可能にする。

## 制作時間
約25時間




