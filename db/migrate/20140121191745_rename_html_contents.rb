class RenameHtmlContents < ActiveRecord::Migration
  def change
  	rename_table :html_contents, :contents
  end
end
