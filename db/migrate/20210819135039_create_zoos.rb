class CreateZoos < ActiveRecord::Migration[5.2]
  def change
    create_table :zoos do |t|
      t.string :name
      t.string :address
      t.text :content
      t.string :photo
      t.time :summer_workday_open
      t.time :summer_workday_close
      t.time :winter_workday_open
      t.time :winter_workday_close
      t.time :summer_holiday_open
      t.time :summer_holiday_close
      t.time :winter_holiday_open
      t.time :winter_holiday_close
      t.integer :general_price
      t.integer :high_school_price
      t.integer :junior_high_school_price
      t.integer :primary_price
      t.integer :senior_price
      t.string :price_comment
      t.string :holiday
      t.integer :area
      t.integer :prefecture

      t.timestamps
    end
  end
end
