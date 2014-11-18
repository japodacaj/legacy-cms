class RemoveSubdomainFromSites < ActiveRecord::Migration
  def change
  	remove_column :sites, :subdomain
  end
end
