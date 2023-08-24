class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email
    add_column :users, :username, :string, null: false, index: { unique: true }
  end
end
