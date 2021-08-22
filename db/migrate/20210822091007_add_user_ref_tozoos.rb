class AddUserRefTozoos < ActiveRecord::Migration[5.2]
  def change
    add_reference :zoos, :user, foreign_key: true
  end
end
