class PagesController < ApplicationController

  before_action :set_site
  before_action :set_stylesheet
  before_action :set_page_elements
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource
  #before_filter :authenticate_user!, only: [:new, :edit, :destroy]

  # GET /pages
  # GET /pages.json
  def index
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != page_path(@page)
      return redirect_to page_path(@page), :status => :moved_permanently
    end
  end

  # GET /pages/new
  def new
    @page.users.build
    @page.build_content
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    respond_to do |format|
      if @page.save
        format.html { redirect_to page_url(@page), notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_url(@page), notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = @site.pages.friendly.find(params[:id])
    end

    def set_index
      @pages = @site.pages.order('name ASC')
    end

    def set_new
      @page = @site.pages.new
    end

    def set_create
      @page = @site.pages.new(page_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :url, :parent_id, :published_at, :expired_at, user_ids: [], content_attributes: [:body])
    end
end
