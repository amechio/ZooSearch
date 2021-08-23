class CreateFavoriteZoos < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_zoos do |t|
      t.references :user, foreign_key: true
      t.references :zoo, foreign_key: true

      t.timestamps
    end
  end
end
