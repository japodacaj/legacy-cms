class QuickLinksController < ApplicationController

  before_action :set_site
  before_action :set_stylesheet
  before_action :set_page_elements
  before_action :set_quick_link, only: [:show, :edit, :update, :destroy]
  before_action :get_positions, only: [:show]
  before_action :set_index, only: [:index]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource except: [:sort]

  # GET /quick_links
  # GET /quick_links.json
  def index
  end

  # GET /quick_links/1
  # GET /quick_links/1.json
  def show
  end

  # POST
  def sort
    params[:link].each_with_index do |id, index|
      Link.where(id: id).update_all(position: index+1)
    end
    render nothing: true, notice: "Updated listing."
  end


  # GET /quick_links/new
  def new
  end

  # GET /quick_links/1/edit
  def edit
  end

  # POST /quick_links
  # POST /quick_links.json
  def create

    respond_to do |format|
      if @quick_link.save
        format.html { redirect_to quick_links_url, notice: 'Quick link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quick_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @quick_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quick_links/1
  # PATCH/PUT /quick_links/1.json
  def update
    respond_to do |format|
      if @quick_link.update(quick_link_params)
        format.html { redirect_to quick_links_url, notice: 'Quick link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quick_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quick_links/1
  # DELETE /quick_links/1.json
  def destroy
    @quick_link.destroy
    respond_to do |format|
      format.html { redirect_to quick_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quick_link
      @quick_link = @site.quick_links.find(params[:id])
    end

    def set_index
      @quick_links = @site.quick_links
    end

    def set_new
      @quick_link = @site.quick_links.new
    end

    def set_create
      @quick_link = @site.quick_links.new(quick_link_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_link_params
      params.require(:quick_link).permit!
    end

    def get_positions

    end
end
