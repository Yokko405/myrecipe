## データベース設計

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
| title       | string     | null: false                    |
| description | text       |                                |
| instructions| text       | null: false                    |

#### アソシエーション
- belongs_to :user
- has_many :recipe_ingredients
- has_many :ingredients, through: :recipe_ingredients

### Active Storage
このアプリケーションでは、画像のアップロードにはActive Storageを使用します。
Active Storageの設定を適切に行うことで、画像は自動的に関連付けられ、管理されます。

### Ingredientsテーブル

| Column | Type   | Options     |
|--------|--------|-------------|
| name   | string | null: false |

#### アソシエーション
- has_many :recipe_ingredients
- has_many :recipes, through: :recipe_ingredients

### RecipeIngredientsテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| recipe_id    | references | null: false, foreign_key: true |
| ingredient_id| references | null: false, foreign_key: true |
| quantity     | string     | null: false                    |

#### アソシエーション
- belongs_to :recipe
- belongs_to :ingredient
