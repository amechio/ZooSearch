class CreateAffiliations < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliations do |t|
      t.references :zoo, foreign_key: true
      t.references :animal, foreign_key: true
      t.text :feature

      t.timestamps
    end
  end
end
