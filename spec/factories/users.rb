FactoryBot.define do
  factory :user do
    username { 'りぼん八ヶ岳'}
    email { 'Ribon@test.com'}
    password { '123Ribon'}
    password_confirmation { password }
  end
end
