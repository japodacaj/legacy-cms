class UpdateIndexesOnMenuItems < ActiveRecord::Migration
  def change
  	remove_index :menu_items, :menuable_id
  	add_index :menu_items, [:menuable_id, :menuable_type]
  end
end
