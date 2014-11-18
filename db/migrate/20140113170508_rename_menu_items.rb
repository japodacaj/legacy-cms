class RenameMenuItems < ActiveRecord::Migration
  def change
  	rename_column :menu_items, :menuable_type, :item_type
  	rename_column :menu_items, :menuable_id, :item_id
  	rename_table :menu_items, :links
  end
end
