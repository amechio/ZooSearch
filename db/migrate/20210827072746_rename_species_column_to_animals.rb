class RenameSpeciesColumnToAnimals < ActiveRecord::Migration[5.2]
  def change
    rename_column :animals, :endangered_species, :endangered_specy
    rename_column :animals, :species, :specy
    rename_column :animals, :subspecies, :subspecy
  end
end
