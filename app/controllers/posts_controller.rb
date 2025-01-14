class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all
    end
    
    def show
      # @post = Post.find_by(id: params[:id])
      #  @post = Post.find(params[:id])
      # Rails.logger.debug "Params: #{params.inspect}"
      @comments = @post.comments.includes(:user)
    end
    
    def new
      @post = Post.new
      authorize! :create, @post
      render :new
    end
    
    def create
      # @post = Post.new
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post , notice: 'Post was successfully created.'
      else
        render 'new'
      end
    end
    
    def edit
    end
    
    def update
      if @post.update(post_params)
        redirect_to @post , notice: 'Post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
      @post.destroy
      redirect_to posts_url, status: :see_other ,notice: 'Post was successfully destroyed.'
    end

    private

    def set_post
    @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title,:user_id,:body ,:post_images)
    end
end

