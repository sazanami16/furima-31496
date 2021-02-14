FactoryBot.define do
  factory :order_card do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code      { '123-1234' }
    prefecture_id     { 5 }
    city             { '富田林市' }
    address          { '向陽台1-1' }
    building         { '301' }
    phone_number     { '09012345678' }
    user_id          { 1 }
    item_id          { 1 }
  end
end
