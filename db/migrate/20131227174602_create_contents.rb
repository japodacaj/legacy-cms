class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :body
      t.references :contentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
