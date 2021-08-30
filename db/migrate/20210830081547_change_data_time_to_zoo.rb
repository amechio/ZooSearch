class ChangeDataTimeToZoo < ActiveRecord::Migration[5.2]
  def down
    remove_column :zoos, :summer_workday_open, :time
    remove_column :zoos, :summer_workday_close, :time
    remove_column :zoos, :winter_workday_open, :time
    remove_column :zoos, :winter_workday_close, :time
    remove_column :zoos, :summer_holiday_open, :time
    remove_column :zoos, :summer_holiday_close, :time
    remove_column :zoos, :winter_holiday_open, :time
    remove_column :zoos, :winter_holiday_close, :time
  end
end
