class MakeUsernameNotNull < ActiveRecord::Migration
  def change
  	change_column :users, :username, :string, default: "", null: false
  end
end
