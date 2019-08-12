class AddUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :avatar, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :password_digest, :string
  end
end
