# == Schema Information
#
# Table name: sites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  short_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#  ancestry   :string(255)
#  layout     :string(255)
#

class Site < ActiveRecord::Base
	extend FriendlyId

	has_many :site_aliases, inverse_of: :site, dependent: :destroy		
	has_many :menus, inverse_of: :site, dependent: :destroy
	has_many :quick_links, inverse_of: :site, dependent: :destroy
	has_many :pages, inverse_of: :site, dependent: :destroy
	has_many :categories, inverse_of: :site, dependent: :destroy
	has_many :home_pages, inverse_of: :site, dependent: :destroy
	has_many :page_elements, inverse_of: :site, dependent: :destroy
	has_many :ckeditor_assets, inverse_of: :site, dependent: :destroy
	has_many :image_uploads, inverse_of: :site, dependent: :destroy
	has_many :file_uploads, inverse_of: :site, dependent: :destroy

	has_many :assignments, as: :assignable, dependent: :destroy
	has_many :users, through: :assignments


  has_one :address, as: :addressable, dependent: :destroy
  has_one :stylesheet, inverse_of: :site

	has_ancestry

	liquid_methods	:name, :short_name, :site_aliases, :menus, :pages,
									:categories, :home_pages, :page_elements, :users, :address

	friendly_id :short_name, use: :slugged

  def should_generate_new_friendly_id?
  	slug.blank? || short_name_changed?
  end


	LAYOUTS = %w[sidebar_left sidebar_right]

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :site_aliases, allow_destroy: true

  def link_arrange
  	self.root.descendants.arrange
  end


  validates :name,
  					presence: true
  validates	:short_name,
  					presence: true,
  					uniqueness: {allow_nil: true}

end
