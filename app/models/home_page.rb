# == Schema Information
#
# Table name: home_pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  active     :boolean
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class HomePage < ActiveRecord::Base
  belongs_to :site, inverse_of: :home_pages

  has_one :content, as: :contentable, dependent: :destroy

  liquid_methods :name, :active

  accepts_nested_attributes_for :content

	validates 	:active,
							uniqueness: {allow_nil: true, scope: :site}
	validates		:name,
							presence: true,
							uniqueness: {allow_nil: true, scope: :site}
end