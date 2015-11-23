class AddTimestampToContact < ActiveRecord::Migration
  def change_table
    add_column(:contacts, :created_at, :datetime)
    add_column(:contacts, :updated_at, :datetime)
  end
end
