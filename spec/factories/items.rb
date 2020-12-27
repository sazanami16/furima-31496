FactoryBot.define do
  factory :item do
    name          {"ito"}
    text          {"伊藤です"}
    category_id   {3}
    condition_id  {2}
    fee_id        {2}
    prefecture_id {5}
    send_time_id  {2}
    price         {5000}
    association :user 
  end
end
