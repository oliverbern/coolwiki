class RenameStatusToRole < ActiveRecord::Migration
  def change
		rename_column :users, :status, :role
  end
end
