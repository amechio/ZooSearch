FactoryBot.define do
  factory :zoo do
    name { 'テスト動物園1' }
    address { 'テスト住所1' }
    content { 'テスト動物園説明1' }
    summer_workday_open { '10:00' }
    summer_workday_close { '17:00' }
    winter_workday_open { '10:00' }
    winter_workday_close { '17:00' }
    summer_holiday_open { '10:00' }
    summer_holiday_close { '17:00' }
    winter_holiday_open { '10:00' }
    winter_holiday_close { '17:00' }
    general_price { '100' }
    area { '北海道・東北' }
    prefecture { '北海道' }
    association :user
  end
  factory :zoo2, class: Zoo do
    name { 'テスト動物園2' }
    address { 'テスト住所2' }
    content { 'テスト動物園説明2' }
    summer_workday_open { '10:00' }
    summer_workday_close { '17:00' }
    winter_workday_open { '10:00' }
    winter_workday_close { '17:00' }
    summer_holiday_open { '10:00' }
    summer_holiday_close { '17:00' }
    winter_holiday_open { '10:00' }
    winter_holiday_close { '17:00' }
    general_price { '200' }
    area { '九州・沖縄' }
    prefecture { '沖縄県' }
    user_id { User.first.id }
  end
  factory :zoo3, class: Zoo do
    name { 'テスト動物園3' }
    address { 'テスト住所3' }
    content { 'テスト動物園説明3' }
    summer_workday_open { '10:00' }
    summer_workday_close { '17:00' }
    winter_workday_open { '10:00' }
    winter_workday_close { '17:00' }
    summer_holiday_open { '10:00' }
    summer_holiday_close { '17:00' }
    winter_holiday_open { '10:00' }
    winter_holiday_close { '17:00' }
    general_price { '300' }
    area { '関東' }
    prefecture { '神奈川県' }
    user_id { User.first.id }
  end
end
