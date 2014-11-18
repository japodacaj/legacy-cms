class RenameContents < ActiveRecord::Migration
  def change
  	rename_table :contents, :html_contents
  end
end
