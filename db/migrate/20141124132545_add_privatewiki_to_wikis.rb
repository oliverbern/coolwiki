class AddPrivatewikiToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :privatewiki, :boolean, default: false
  end
end
