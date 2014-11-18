class Admin::StylesheetsController < ApplicationController

  layout 'admin'

  before_action :set_site
  before_action :set_stylesheet, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource

  # GET /stylesheets
  # GET /stylesheets.json
  def index
  end

  # GET /stylesheets/1
  # GET /stylesheets/1.json
  def show
    respond_to do |format|
      format.html # regular ERB template
      format.css { render text: @stylesheet.content.body, content_type: "text/css" }
    end
  end

  # GET /stylesheets/new
  def new
    @stylesheet.build_content
  end

  # GET /stylesheets/1/edit
  def edit
  end

  # POST /stylesheets
  # POST /stylesheets.json
  def create    
    respond_to do |format|
      if @stylesheet.save
        format.html { redirect_to admin_stylesheets_url, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stylesheet }
      else
        format.html { render action: 'new' }
        format.json { render json: @stylesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stylesheets/1
  # PATCH/PUT /stylesheets/1.json
  def update
    respond_to do |format|
      if @stylesheet.update(stylesheet_params)
        format.html { redirect_to admin_stylesheets_url, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stylesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stylesheets/1
  # DELETE /stylesheets/1.json
  def destroy
    @stylesheet.destroy
    respond_to do |format|
      format.html { redirect_to admin_stylesheets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_index
      @stylesheets = @site.stylesheet
    end

    def set_new
      @stylesheet = @site.stylesheets.new
    end

    def set_create
      @stylesheet = @site.stylesheets.new(stylesheet_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stylesheet_params
      params.require(:stylesheet).permit(:site_id, content_attributes:[:body])
    end

end
