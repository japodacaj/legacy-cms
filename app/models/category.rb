# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  site_id    :integer
#

class Category < ActiveRecord::Base
	extend FriendlyId

	belongs_to :site, inverse_of: :categories

	has_many :assignments, as: :assignable, dependent: :destroy
	has_many :users, through: :assignments

	has_many :links, as: :item, dependent: :destroy

	has_many :posts, inverse_of: :category, dependent: :destroy

	has_many :last_three_posts, -> { order("id DESC").limit(3) }, class_name: 'Post'

	liquid_methods :name, :category_url, :posts, :last_three_posts

  def category_url
		['/categories/', self.slug].join
  end

	friendly_id :name, use: :scoped, scope: :site

  def should_generate_new_friendly_id?
  	slug.blank? || name_changed?
  end

  validates	:name,
  					presence: true

end
