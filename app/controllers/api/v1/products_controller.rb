# frozen_string_literal: true

module Api
  module V1
    # This is a Products Controller class
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show update destroy]

      def index
        products = ProductFilter.retrieve_all
        render json: products, status: :ok
      end

      def show
        render json: @product, status: :ok
      end

      def create
        product = Product.new(product_params)

        if ProductService.save(product)
          render json: product, status: :created
        else
          render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if ProductService.update(@product, product_params)
          render json: @product, status: :ok
        else
          render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        ProductService.destroy(@product)
        head :no_content
      end

      private

      def product_params
        params.require(:product).permit(:tittle, :description, :brand, :value, :size, :quantity, :category)
      end

      def set_product
        @product = ProductFilter.find_by_id(id: params[:id])
        render json: { errors: 'Product not found' }, status: :not_found unless @product
      end
    end
  end
end
