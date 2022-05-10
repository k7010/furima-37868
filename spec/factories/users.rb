FactoryBot.define do
  factory :user do
    nickname              { 'testテスト' }
    email                 { Faker::Internet.free_email }
    password              { 'pass1234' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2010-02-01' }
  end
end
