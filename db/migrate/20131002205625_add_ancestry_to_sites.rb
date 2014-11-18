class AddAncestryToSites < ActiveRecord::Migration
  def change
    add_column :sites, :ancestry, :string
  end
end
