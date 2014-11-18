class CreateSiteAliases < ActiveRecord::Migration
  def change
    create_table :site_aliases do |t|
      t.string :name
      t.belongs_to :site, index: true

      t.timestamps
    end
  end
end
