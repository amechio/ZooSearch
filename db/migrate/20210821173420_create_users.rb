class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :live_prefecture
      t.integer :favorite_prefecture
      t.text :content
      t.string :icon
      t.boolean :owner
      t.boolean :admin

      t.timestamps
    end
  end
end
