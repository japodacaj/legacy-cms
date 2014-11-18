class AddSiteToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :site, index: true
  end
end
