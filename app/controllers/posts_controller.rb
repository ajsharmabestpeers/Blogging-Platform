class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
    def index
        @posts = Post.all
      end
    
      def show
        # @post = Post.find_by(id: params[:id])
        #  @post = Post.find(params[:id])
        Rails.logger.debug "Params: #{params.inspect}"
        @post = Post.find(params[:id])
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
            redirect_to @post 
        else
            render 'new'
        end
      end
    
      def edit
        @post = Post.find(params[:id]) 
      end
    
      def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
          redirect_to @post
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        # @post.destroy
        # redirect_to posts_url, notice: 'Post was successfully destroyed.'
        
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_url, status: :see_other ,notice: 'Post was successfully destroyed.'
    
      end

      private
      def post_params
        params.require(:post).permit(:title,:user_id,:body)
      end
end
