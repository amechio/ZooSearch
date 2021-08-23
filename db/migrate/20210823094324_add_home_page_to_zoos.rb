class AddHomePageToZoos < ActiveRecord::Migration[5.2]
  def change
    add_column :zoos, :home_page, :string
  end
end
