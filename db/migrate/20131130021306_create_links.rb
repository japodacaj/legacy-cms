class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.belongs_to :site, index: true

      t.timestamps
    end
  end
end
