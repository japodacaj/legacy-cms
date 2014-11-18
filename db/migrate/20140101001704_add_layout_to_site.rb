class AddLayoutToSite < ActiveRecord::Migration
  def change
    add_column :sites, :layout, :string
  end
end
