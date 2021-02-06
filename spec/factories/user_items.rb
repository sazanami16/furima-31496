FactoryBot.define do
  factory :user_item do
    postal_code      { '1231234' }
    prefecture_id    { 5 }
    city             { '富田林市' }
    address          { '向陽台1-1-301' }
    phone_number     { '09012345678' }
  end
end
