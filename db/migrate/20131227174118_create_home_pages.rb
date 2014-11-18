class CreateHomePages < ActiveRecord::Migration
  def change
    create_table :home_pages do |t|
      t.string :name
      t.boolean :active
      t.belongs_to :site, index: true

      t.timestamps
    end
  end
end
