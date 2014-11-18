class Admin::PageElementsController < ApplicationController

  layout 'admin'

  before_action :set_site
  before_action :set_page_element, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource

  # GET /page_elements
  # GET /page_elements.json
  def index
  end

  # GET /page_elements/1
  # GET /page_elements/1.json
  def show
  end

  # GET /page_elements/new
  def new
    @page_element.build_content
  end

  # GET /page_elements/1/edit
  def edit
  end

  # POST /page_elements
  # POST /page_elements.json
  def create    
    respond_to do |format|
      if @page_element.save
        format.html { redirect_to admin_page_elements_url, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page_element }
      else
        format.html { render action: 'new' }
        format.json { render json: @page_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_elements/1
  # PATCH/PUT /page_elements/1.json
  def update
    respond_to do |format|
      if @page_element.update(page_element_params)
        format.html { redirect_to admin_page_elements_url, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_elements/1
  # DELETE /page_elements/1.json
  def destroy
    @page_element.destroy
    respond_to do |format|
      format.html { redirect_to admin_page_elements_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_element
      @page_element = @site.page_elements.find(params[:id])
    end

    def set_index
      @page_elements = @site.page_elements
    end

    def set_new
      @page_element = @site.page_elements.new
    end

    def set_create
      @page_element = @site.page_elements.new(page_element_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_element_params
      params.require(:page_element).permit(:name, content_attributes:[:body])
    end

end
