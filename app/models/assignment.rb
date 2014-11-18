# == Schema Information
#
# Table name: assignments
#
#  id              :integer          not null, primary key
#  assignable_id   :integer
#  assignable_type :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#

class Assignment < ActiveRecord::Base
  belongs_to :assignable, polymorphic: true
  belongs_to :user, inverse_of: :assignments
end
