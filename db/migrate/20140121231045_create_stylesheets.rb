class CreateStylesheets < ActiveRecord::Migration
  def change
    create_table :stylesheets do |t|
      t.references :site, index: true

      t.timestamps
    end
  end
end
