class CategoriesController < ApplicationController
        before_action :authenticate_user! 
        before_action :set_category, only: %i[show edit update destroy]
        before_action :authorize_admin, only: %i[new create edit update destroy] 
      
        def index
          @categories = Category.all
        end
      
        def show
          # @category = Category.find(params[:id])
          @posts = @category.posts
          @posts = @posts.page(params[:page]).per(2)
        end
      
        def new
          @category = Category.new
        end
      
        def edit
          render :new
        end
      
        def create
          @category = Category.new(category_params)
          if @category.save
            redirect_to categories_path, notice: "Category created successfully!"
          else
            render :new
          end
        end
      
        def update
          if @category.update(category_params)
            redirect_to @category, notice: "Category updated successfully!"
          else
            render :edit
          end
        end
      
        def destroy
          @category.destroy
          redirect_to categories_path, notice: "Category deleted successfully!"
        end
      
        private
      
        def set_category
          @category = Category.find_by(id: params[:id])
          redirect_to categories_path, alert: "Category not found" if @category.nil?
        end
      
        def category_params
          params.require(:category).permit(:name)
        end

        def authorize_admin
          unless current_user&.admin? || current_user&.author? 
            redirect_to categories_path, alert: "You are not authorized to manage categories."
          end
        end

end
