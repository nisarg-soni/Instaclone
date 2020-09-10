class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @new_post = Post.new
    @posts = Post.paginate(page: params[:page], per_page: 4).order(created_at: :desc)
    
  end


  def edit
  end


  def create
    @post = Post.new(post_params)

    
      if @post.save
        redirect_to root_url, notice: 'Creation Successfull'
      else
        redirect_to root_url, notice: 'Creation Unsuccessfull'
      end
    
  end


  def update
      if @post.update(post_params)
        redirect_to root_url, notice: 'Update Successfull'    
      else
        render :edit    
      end
  end


  def destroy
    @post.destroy
    redirect_to root_url,notice: 'Deletion Successfull'
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:image, :caption)
    end
end
