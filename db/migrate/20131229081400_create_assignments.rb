class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :assignable, polymorphic:true, index: true

      t.timestamps
    end
  end
end
