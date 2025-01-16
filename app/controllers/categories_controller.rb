class CategoriesController < ApplicationController
        before_action :set_category, only: %i[show edit update destroy]
      
        def index
          @categories = Category.all
        end
      
        def show
          # @category = Category.find(params[:id])
          @posts = @category.posts
        end
      
        def new
          @category = Category.new
        end
      
        def edit
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
end
