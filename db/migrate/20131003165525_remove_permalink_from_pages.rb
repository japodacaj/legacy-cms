class RemovePermalinkFromPages < ActiveRecord::Migration
  def change
  	remove_column :pages, :permalink
  end
end
