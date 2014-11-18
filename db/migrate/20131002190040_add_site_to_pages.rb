class AddSiteToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :site, index: true
  end
end
