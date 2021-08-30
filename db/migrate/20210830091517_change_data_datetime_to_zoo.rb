class ChangeDataDatetimeToZoo < ActiveRecord::Migration[5.2]
  def change
    add_column :zoos, :summer_workday_open, :datetime
    add_column :zoos, :summer_workday_close, :datetime
    add_column :zoos, :winter_workday_open, :datetime
    add_column :zoos, :winter_workday_close, :datetime
    add_column :zoos, :summer_holiday_open, :datetime
    add_column :zoos, :summer_holiday_close, :datetime
    add_column :zoos, :winter_holiday_open, :datetime
    add_column :zoos, :winter_holiday_close, :datetime
  end
end
