class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest
      t.integer :live_prefecture
      t.integer :favorite_prefecture
      t.text :content
      t.string :icon
      t.boolean :owner, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
