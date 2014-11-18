class AddSiteToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :site, index: true
  end
end
