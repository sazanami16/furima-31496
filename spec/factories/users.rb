FactoryBot.define do
  factory :user do
    nick_name { 'ito' }
    email                 { 'ito123@com' }
    password              { 'k10287' }
    password_confirmation { password }
    last_name             { '伊藤' }
    first_name            { '大志' }
    last_reading          { 'イトウ' }
    first_reading         { 'タイシ' }
    birth                 { '1992-10-30' }
  end
end
