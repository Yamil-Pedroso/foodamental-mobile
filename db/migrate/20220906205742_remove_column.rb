class RemoveColumn < ActiveRecord::Migration[7.0]
  def self.up
    remove_column :lists, :user_id
  end
end
