class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.attachment :data
      t.references :uploadable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
