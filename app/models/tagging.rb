# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#

class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :post
end
