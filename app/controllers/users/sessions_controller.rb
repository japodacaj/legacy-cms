class Users::SessionsController < Devise::SessionsController

	layout 'static'

	before_action :set_site

end
