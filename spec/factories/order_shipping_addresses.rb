FactoryBot.define do
  factory :order_shipping_address do
    postal_code     { '123-1234' }
    prefecture_id   { 2 }
    city            { Faker::Address.city }
    address         { Faker::Address.street_address }
    telephone       { '09012345678' }
    token           { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
