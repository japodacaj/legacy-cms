# == Schema Information
#
# Table name: links
#
#  id            :integer          not null, primary key
#  menu_id       :integer
#  item_id       :integer
#  item_type     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  position      :integer
#  linkable_id   :integer
#  linkable_type :string(255)
#

class Link < ActiveRecord::Base

	belongs_to :linkable, polymorphic: true
	belongs_to :item, polymorphic: true

	liquid_methods :item_name, :item_url, :arranged_pages

	acts_as_list scope: :linkable

	def item_name
		self.item.name
	end

	def item_url
		if self.item_type == "Page"
			if self.item.url?
				self.item.url
			else
				['/pages/', self.item.slug].join
			end
		elsif self.item_type == "Category"
			['/categories/', self.item.slug].join
		end
	end

	def arranged_pages
		if self.item_type == "Page"	
			self.item.descendants.arrange(order: :name)
		end
	end

end
