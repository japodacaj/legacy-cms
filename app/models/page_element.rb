# == Schema Information
#
# Table name: page_elements
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class PageElement < ActiveRecord::Base
  
  belongs_to :site, inverse_of: :page_elements

  has_one :content, as: :contentable, dependent: :destroy

  liquid_methods :name

	ELEMENTS = %w[header footer sidebar navbar]

  accepts_nested_attributes_for :content

  validates :name,
  					presence: true,
  					uniqueness: {allow_nil: true, scope: :site}
end
