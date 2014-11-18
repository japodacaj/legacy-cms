# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  slug         :string(255)
#  ancestry     :string(255)
#  site_id      :integer
#  url          :string(255)
#  published_at :datetime
#  expired_at   :datetime
#

class Page < ActiveRecord::Base
	extend FriendlyId

	belongs_to :site, inverse_of: :pages

	has_many :assignments, as: :assignable, dependent: :destroy
	has_many :users, through: :assignments

  has_one :content, as: :contentable, dependent: :destroy
	has_many :links, as: :item, dependent: :destroy

  has_ancestry

  liquid_methods	:name, :url, :url?, :slug, :publish_date, :expiration_date,
  								:root, :is_root?, :has_children?, :descendants, :arranged_pages, :page_url, :content

  def page_url
			if self.url?
				self.url
			else
				['/pages/', self.slug].join
			end
  end

	friendly_id :name, use: :scoped, scope: :site

  def should_generate_new_friendly_id?
  	slug.blank? || name_changed?
  end

  def arranged_pages
  	self.descendants.arrange
  end

  accepts_nested_attributes_for :content

	validates 	:name,
							presence: true,
							uniqueness: {scope: :site }

end
