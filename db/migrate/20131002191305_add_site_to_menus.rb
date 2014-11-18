class AddSiteToMenus < ActiveRecord::Migration
  def change
    add_reference :menus, :site, index: true
  end
end
