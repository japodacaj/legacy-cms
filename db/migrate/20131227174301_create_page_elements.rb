class CreatePageElements < ActiveRecord::Migration
  def change
    create_table :page_elements do |t|
      t.string :name
      t.belongs_to :site, index: true

      t.timestamps
    end
  end
end
