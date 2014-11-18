# == Schema Information
#
# Table name: contents
#
#  id               :integer          not null, primary key
#  body             :text
#  contentable_id   :integer
#  contentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true

  liquid_methods :body
end
