class CreateMenusPositions < ActiveRecord::Migration
  def change
    create_table :menu_positions do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :positionable, index: true
      t.string :positionable_type
      t.integer :position
      t.timestamps
    end
  end
end