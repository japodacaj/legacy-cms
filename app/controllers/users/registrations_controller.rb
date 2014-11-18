class Users::RegistrationsController < Devise::RegistrationsController

	layout 'static'

	before_action :set_site

end
