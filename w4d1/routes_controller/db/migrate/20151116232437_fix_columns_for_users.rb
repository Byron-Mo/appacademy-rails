class FixColumnsForUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :user, :string
  end
end
