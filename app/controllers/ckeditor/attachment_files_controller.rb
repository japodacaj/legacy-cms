class Ckeditor::AttachmentFilesController < Ckeditor::ApplicationController

  before_filter :set_site, only: [:index, :create]

  def index
    @attachments = Ckeditor.attachment_file_adapter.find_all(ckeditor_attachment_files_scope)
    @attachments = @attachments.where(site_id: @site.id)
    respond_with(@attachments)
  end
  
  def create
    @attachment = Ckeditor.attachment_file_model.new
    @attachment.site = @site
          respond_with_asset(@attachment)
  end
  
  def destroy
    @attachment.destroy
    respond_with(@attachment, :location => attachment_files_path)
  end
  
  protected
  
    def find_asset
      @attachment = Ckeditor.attachment_file_adapter.get!(params[:id])
    end

    def authorize_resource
      model = (@attachment || Ckeditor.attachment_file_model)
      @authorization_adapter.try(:authorize, params[:action], model)
    end
end