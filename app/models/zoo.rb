class Zoo < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :summer_workday_open, presence: true
  validates :summer_workday_close, presence: true
  validates :winter_workday_open, presence: true
  validates :winter_workday_close, presence: true
  validates :summer_holiday_open, presence: true
  validates :summer_holiday_close, presence: true
  validates :winter_holiday_open, presence: true
  validates :winter_holiday_close, presence: true
  validates :general_price, presence: true
  validates :area, presence: true
  validates :prefecture, presence: true
end
