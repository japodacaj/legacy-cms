# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  category_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  slug         :string(255)
#  published_at :datetime
#  expired_at   :datetime
#  content      :text
#

class Post < ActiveRecord::Base
	extend FriendlyId

  belongs_to :category, inverse_of: :posts

  has_one :content, as: :contentable, dependent: :destroy

	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings

	liquid_methods :title, :publish_date, :expiration_date, :updated_at, :post_url, :tags, :content

  def post_url
				['/categories/', self.category.slug, '/posts/', self.slug].join
  end

	friendly_id :title, use: :scoped, scope: :category

  def should_generate_new_friendly_id?
  	slug.blank? || title_changed?
  end

	def self.tagged_with(name)
	  Tag.find_by_name!(name).pages
	end

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end

  accepts_nested_attributes_for :content

  validates	:title,
  					presence: true,
  					uniqueness: {scope: :category}

end
