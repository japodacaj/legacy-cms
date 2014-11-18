# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)      default(""), not null
#  first                  :string(255)
#  last                   :string(255)
#  super_admin            :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  			 :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments, inverse_of: :user
  has_many :sites, through: :assignments, source: :assignable, source_type: 'Site'
  has_many :pages, through: :assignments, source: :assignable, source_type: 'Page'
  has_many :categories, through: :assignments, source: :assignable, source_type: 'Category'

  liquid_methods :username, :first, :last, :email, :sites, :pages, :categories

  def full_name
    [first, last].join (' ')
  end

end
