FactoryBot.define do
  factory :order_card do
    postal_code      { '123-1234' }
    prefecture       { 5 }
    city             { '富田林市' }
    address          { '向陽台1-1-301' }
    phone_number     { '09012345678' }
  end
end
