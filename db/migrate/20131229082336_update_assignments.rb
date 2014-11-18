class UpdateAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :user_id, :integer
  	add_index :assignments, :user_id
  end
end
