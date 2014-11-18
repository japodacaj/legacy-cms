class RenameMenuPositions < ActiveRecord::Migration
  def change
  	rename_table :menu_positions, :menu_items
  end
end
