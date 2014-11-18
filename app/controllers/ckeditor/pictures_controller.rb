class Ckeditor::PicturesController < Ckeditor::ApplicationController

	before_filter :set_site, only: [:index, :create]

  def index
    @pictures = Ckeditor.picture_adapter.find_all(ckeditor_pictures_scope)
    @pictures = @pictures.where(site_id: @site.id)
    respond_with(@pictures) 
  end
  
  def create
    @picture = Ckeditor.picture_model.new
    @picture.site = @site
          respond_with_asset(@picture)
  end
  
  def destroy
    @picture.destroy
    respond_with(@picture, :location => pictures_path)
  end
  
  protected

    def find_asset
      @picture = Ckeditor.picture_adapter.get!(params[:id])
    end

    def authorize_resource
      model = (@picture || Ckeditor.picture_model)
      @authorization_adapter.try(:authorize, params[:action], model)
    end

end