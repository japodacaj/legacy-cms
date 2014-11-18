# == Schema Information
#
# Table name: site_aliases
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  site_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  google_code :string(255)
#

class SiteAlias < ActiveRecord::Base
  belongs_to :site, inverse_of: :site_aliases

  liquid_methods :name

  validates	:name,
  					uniqueness: {allow_nil: true}
end
