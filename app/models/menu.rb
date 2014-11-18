# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  site_id    :integer
#

class Menu < ActiveRecord::Base

	belongs_to :site, inverse_of: :menus

	has_many :links, as: :linkable, dependent: :destroy
	has_many :pages, :through => :links, :source => :item, :source_type => 'Page'
  has_many :categories, :through => :links, :source => :item, :source_type => 'Category'

	liquid_methods :name, :ordered_links

	def ordered_links
		self.links.order("position ASC")
	end

	validates	:name,
						presence: true,
						uniqueness: {scope: :site}

end
