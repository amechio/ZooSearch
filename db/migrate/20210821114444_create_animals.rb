class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :english_name
      t.string :scientific_name
      t.string :distribution
      t.integer :endangered_species
      t.text :content
      t.string :photo
      t.string :kingdom
      t.string :phylum
      t.string :animal_class
      t.string :order
      t.string :family
      t.string :genus
      t.string :species
      t.string :subspecies

      t.timestamps
    end
  end
end
