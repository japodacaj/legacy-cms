class Admin::MenusController < ApplicationController

  layout 'admin'

  before_action :set_site
  before_action :set_stylesheet
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :get_positions, only: [:show]
  before_action :set_index, only: [:index]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource except: [:sort]

  # GET /menus
  # GET /menus.json
  def index
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # POST
  def sort
    params[:link].each_with_index do |id, index|
      Link.where(id: id).update_all(position: index+1)
    end
    render nothing: true, notice: "Updated listing."
  end


  # GET /menus/new
  def new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    respond_to do |format|
      if @menu.save
        format.html { redirect_to admin_menu_url(@menu), notice: 'menu was successfully created.' }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to admin_menu_url(@menu), notice: 'menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_menus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = @site.menus.find(params[:id])
    end

    def set_index
      @menus = @site.menus
    end

    def set_new
      @menu = @site.menus.new
    end

    def set_create
      @menu = @site.menus.new(menu_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit!
    end

    def get_positions

    end
end
