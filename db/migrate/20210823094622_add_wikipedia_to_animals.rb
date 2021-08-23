class AddWikipediaToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :wikipedia, :string
  end
end
