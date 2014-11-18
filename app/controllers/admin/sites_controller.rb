class Admin::SitesController < ApplicationController

  layout 'admin', except: [:show]

  before_action :set_site, only: [:show]
  before_action :set_stylesheet, only: [:show]
  before_action :set_page_elements, only: [:show]
  before_action :set_edit, only: [:edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource

  # GET /sites
  # GET /sites.json
  def index
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @home_page = @site.home_pages.find_by_active(true)
    render layout: 'application'
  end

  # GET /sites/new
  def new
    @site.site_aliases.build
    @site.build_address
  end

  # GET /sites/1/edit
  def edit
    @site.site_aliases.build
    @site.build_address
  end

  # POST /sites
  # POST /sites.json
  def create
    respond_to do |format|
      if @site.save
        format.html { redirect_to root_url(subdomain: @site.slug), notice: 'Site was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to root_url(subdomain: @site.slug), notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_edit
      @site = Site.friendly.find(params[:id])
    end

    def set_index
      @sites = Site.all
    end

    def set_new
      @site = Site.new
    end

    def set_create
      @site = Site.new(site_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :layout, :parent_id, :short_name, user_ids: [], site_aliases_attributes: [:id, :name, :_destroy], address_attributes: [:id, :line1, :line2, :city, :state, :zip])
    end
end