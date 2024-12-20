class CategoriesController < ApplicationController
    module Api
      module V1
        class CategoriesController < ApplicationController
          before_action :set_category, only: %i[show update destroy]
    
          def index
            categories = CategoryFilter.retrieve_all
            render json: categories, status: :ok
          end
    
          def show
            render json: @category, status: :ok
          end
    
          def create
            category = Category.new(category_params)
    
            if category.save
              render json: category, status: :created
            else
              render json: { errors: category.errors.full_message }, status: :unprocessable_entity
            end
          end
    
          def update
            if @category.update(category_params)
              render json: @category, status: :ok
            else
              render json: { errors: category.errors.full_message }, status: :unprocessable_entity
            end
          end
    
          def destroy
            @category.destroy
            head :no_content
          end
    
          private
    
          def category_params
            params
              .require(:category)
              .permit(:title, :description)
          end
    
          def set_category
            @category = CategoryFilter.find_by_id(params[:id])
          end
    
        end
      end
    end
    
end
