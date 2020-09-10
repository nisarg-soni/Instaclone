class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @new_post = Post.new
    # @posts = Post.all
    @posts = Post.paginate(:page => params[:page], :per_page => 2).order('created_at DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  # def show
  # end

  # GET /posts/new
  # def new
  #   @post = Post.new
  # end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    
      if @post.save
        redirect_to root_url, notice: 'Creation Successfull'
        # format.html {  }
        # format.json { render :show, status: :created, location: @post }
      else
        redirect_to root_url, notice: 'Creation Unsuccessfull'
        # format.html { render :new }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # respond_to do |format|
      # if @post.update(post_params)
      #   format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @post }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @post.errors, status: :unprocessable_entity }
      # end
      if @post.update(post_params)
        redirect_to root_url, notice: 'Update Successfull'    
      else
        render :edit    
      end
    # end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    # respond_to do |format|
    #   format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to root_url,notice: 'Deletion Successfull'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:image, :caption)
    end
end
