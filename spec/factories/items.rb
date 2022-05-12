FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name              { '商品名a1' }
    description       { '商品説明a1' }
    category_id       { 2 }
    status_id         { 2 }
    cost_id           { 2 }
    prefecture_id     { 2 }
    delivery_day_id   { 2 }
    price             { '5000' }
    association :user
  end
end
