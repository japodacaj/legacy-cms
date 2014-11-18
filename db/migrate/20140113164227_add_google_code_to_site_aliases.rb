class AddGoogleCodeToSiteAliases < ActiveRecord::Migration
  def change
    add_column :site_aliases, :google_code, :string
  end
end
