FactoryBot.define do
  factory :user do
    username { 'りぼん八ヶ岳'}
    email { Faker::Internet.unique.email}
    password { '123Ribon'}
    password_confirmation { password }
  end
end
