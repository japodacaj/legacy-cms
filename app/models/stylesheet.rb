# == Schema Information
#
# Table name: stylesheets
#
#  id         :integer          not null, primary key
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Stylesheet < ActiveRecord::Base

  belongs_to :site, inverse_of: :stylesheet

  has_one :content, as: :contentable, dependent: :destroy

  accepts_nested_attributes_for :content

end
