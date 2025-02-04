# frozen_string_literal: true

module Api
  module V1
    # This is a Category Controller class
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

        if CategoryService.save(category)
          render json: category, status: :created
        else
          render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if CategoryService.update(@category, category_params)
          render json: @category, status: :ok
        else
          render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        CategoryService.destroy(@category)
        head :no_content
      end

      private

      def category_params
        params.require(:category).permit(:title, :description)
      end

      def set_category
        @category = CategoryFilter.find_by_id(id: params[:id])
        render json: { errors: 'Category not found' }, status: :not_found unless @category
      end
    end
  end
end
