class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :set_layout

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  protected

	def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :first, :last, :email]
    devise_parameter_sanitizer.for(:sign_in) << :username
    devise_parameter_sanitizer.for(:account_update) << [:username, :first, :last, :roles]
  end

  def set_site
    if request.domain.present? && request.domain != 'bitbrews.com'
      @site = Site.joins(:site_aliases).where("site_aliases.name LIKE ?", request.domain).first
    elsif request.subdomain.present? && request.subdomain != 'www'
      @site = Site.friendly.find(request.subdomain)
    end
  end

  def set_layout
    (@site.layout? && @site.layout) || 'standard'
  end

  def set_stylesheet
    @stylesheet = @site.stylesheet
  end

  def set_page_elements
    @navbar = @site.page_elements.find_by_name('navbar')
    @header = @site.page_elements.find_by_name('header')
    @sidebar = @site.page_elements.find_by_name('sidebar')
    @footer = @site.page_elements.find_by_name('footer')
  end

end
