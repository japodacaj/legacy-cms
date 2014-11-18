class AddIndexToSites < ActiveRecord::Migration
  def change
  	add_index :sites, :ancestry
  end
end
