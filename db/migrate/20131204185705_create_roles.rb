class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :roleable_type
      t.integer :roleable_id, index: true

      t.timestamps
    end
  end
end
