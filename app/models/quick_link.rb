# == Schema Information
#
# Table name: quick_links
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  site_id    :integer
#

class QuickLink < ActiveRecord::Base
	belongs_to :site, inverse_of: :quick_links

	has_many :links, as: :linkable, dependent: :destroy
	has_many :pages, :through => :links, :source => :item, :source_type => 'Page'
  has_many :categories, :through => :links, :source => :item, :source_type => 'Category'

	liquid_methods :name, :ordered_links

	def ordered_links
		self.links.order("position DESC")
	end

end
