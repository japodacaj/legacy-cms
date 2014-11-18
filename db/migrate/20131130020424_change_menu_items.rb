class ChangeMenuItems < ActiveRecord::Migration
  def change
  	rename_column :menu_items, :positionable_type, :menuable_type
  	rename_column :menu_items, :positionable_id, :menuable_id
  end
end
