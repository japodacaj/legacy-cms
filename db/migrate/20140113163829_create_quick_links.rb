class CreateQuickLinks < ActiveRecord::Migration
  def change
    create_table :quick_links do |t|
      t.string :name
      t.references :site, index: true

      t.timestamps
    end
  end
end
