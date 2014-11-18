class Admin::HomePagesController < ApplicationController

  layout 'admin'

  before_action :set_site
  before_action :set_stylesheet
  before_action :set_home_page, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource

  # GET /home_pages
  # GET /home_pages.json
  def index
  end

  # GET /home_pages/1
  # GET /home_pages/1.json
  def show
    
  end

  # GET /home_pages/new
  def new
    @home_page.build_content
  end

  # GET /home_pages/1/edit
  def edit
  end

  # POST /home_pages
  # POST /home_pages.json
  def create
    respond_to do |format|
      if @home_page.save
        format.html { redirect_to admin_home_page_url(@home_page), notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @home_page }
      else
        format.html { render action: 'new' }
        format.json { render json: @home_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_pages/1
  # PATCH/PUT /home_pages/1.json
  def update
    respond_to do |format|
      if @home_page.update(home_page_params)
        format.html { redirect_to admin_home_page_url(@home_page), notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @home_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_pages/1
  # DELETE /home_pages/1.json
  def destroy
    @home_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_home_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_page
      @home_page = @site.home_pages.find(params[:id])
    end

    def set_index
      @home_pages = @site.home_pages
    end

    def set_new
      @home_page = @site.home_pages.new
    end

    def set_create
      @home_page = @site.home_pages.new(home_page_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_page_params
      params.require(:home_page).permit(:name, :active, content_attributes:[:body])
    end

end
