class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post  
    load_and_authorize_resource

    def create
        @comment = @post.comments.build(comment_params)
        @comment.user = current_user
      if @comment.save
        puts "Comment saved!"  
        redirect_to @post, notice: 'Comment added successfully.'
      else
        puts "Failed to save comment." 
        redirect_to @post, alert: 'Failed to add comment.'
      end
    end

    def show
      @comment.destroy
      redirect_to @post, notice: 'Comment was successfully deleted.'
    end
    
    # def edit
    #     @post = Post.find(params[:article_id])
    #     @comment = @post.comments.find(params[:id])
    #   end

    # def destroy
    #   if @comment.user == admin 
    #     @comment.destroy
    #     redirect_to @post, notice: 'Comment was successfully deleted.'
    #   else
    #     redirect_to @post, alert: 'You can only delete your own comments.'
    #   end
    # end

    def update
      @comment = Comment.find(params[:id])

      if @comment.update(comment_params)
        redirect_to @post
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
    def set_post
      @post = Post.find(params[:post_id])  
    rescue ActiveRecord::RecordNotFound
      redirect_to posts_path, alert: 'Post not found.' 
    end
   
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end


