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

class FileUpload < Upload

	belongs_to :site, inverse_of: :uploads
	belongs_to :uploadable, polymorphic: true

  has_attached_file :data,
                    :path => "/:site_name/file_uploads/:id/:filename"

  validates_attachment_size :data, :less_than => 5.megabytes
  validates_attachment_presence :data

end
