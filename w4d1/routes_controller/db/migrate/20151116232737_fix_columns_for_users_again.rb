class FixColumnsForUsersAgain < ActiveRecord::Migration
  def change
    remove_column :users, :user
    add_column :users, :username, :string
  end
end
