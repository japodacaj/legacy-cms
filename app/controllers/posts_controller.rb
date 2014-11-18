class PostsController < ApplicationController
  
  before_action :set_site
  before_action :set_stylesheet
  before_action :set_page_elements
  before_action :set_category
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :set_new, only: [:new]
  before_action :set_create, only: [:create]
  authorize_resource

  # GET /posts
  # GET /posts.json
  def index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != category_post_path(@category, @post)
      return redirect_to category_post_path(@category, @post), :status => :moved_permanently
    end
  end

  # GET /posts/new
  def new
    @post.build_content
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    respond_to do |format|
      if @post.save
        format.html { redirect_to category_post_url(@category, @post), notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to category_post_url(@category, @post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to category_url(@category) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_category
      @category = @site.categories.friendly.find(params[:category_id])
    end

    def set_post
      @post = @category.posts.friendly.find(params[:id])
    end

    def set_index
      if params[:tag]
        @posts = @category.posts.tagged_with(params[:tag])
      else
        @posts = @category.posts
      end
    end

    def set_new
      @post = @category.posts.new
    end

    def set_create
      @post = @category.posts.new(post_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :tag_list, :published_at, :expired_at, content_attributes: [:body])
    end
end
