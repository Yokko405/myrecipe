FactoryBot.define do
  factory :recipe do
    title { 'My Recipe' }
    description { 'This is a great recipe' }
    instructions { 'Mix ingredients and cook' }
    user # レシピに関連付けるユーザーを指定

    # ネストされた材料を作成する場合は、以下のように属性を追加します
    after(:build) do |recipe|
      recipe.ingredients << build(:ingredient, recipe:) # 'ingredient'もファクトリーを定義しておく必要があります。
    end
  end
end
