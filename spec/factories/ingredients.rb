# spec/factories/ingredients.rb
FactoryBot.define do
  factory :ingredient do
    name { "Apple" } # ここでランダムな値を生成するためにFakerなどを使うこともできます
    quantity { "100g" }
    recipe # これにより、関連するレシピが自動的に生成されます。必要に応じて、テスト内で明示的に指定することもできます。
  end
end
