# == Schema Information
#
# Table name: uploads
#
#  id                :integer          not null, primary key
#  data_file_name    :string(255)
#  data_content_type :string(255)
#  data_file_size    :integer
#  data_updated_at   :datetime
#  uploadable_id     :integer
#  uploadable_type   :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  site_id           :integer
#

class Upload < ActiveRecord::Base

	Paperclip.interpolates :site_name do |attachment, style|
	  attachment.instance.site.slug
	end

end
