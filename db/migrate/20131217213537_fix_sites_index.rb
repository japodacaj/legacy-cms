class FixSitesIndex < ActiveRecord::Migration
  def change
  	add_index :sites, :slug, unique: true
  end
end
