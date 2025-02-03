# frozen_string_literal: true

module Api
  module V1
    # This is a SalesProducts Controller class
    class SalesProductsController < ApplicationController
      before_action :set_sales_products, only: %i[show update destroy]

      def index
        sale_products = SaleProductFilter.retrieve_all
        render json: sale_products, status: :ok
      end

      def show
        render json: @sale_products, status: :ok
      end

      def create
        sale_products = SaleProduct.new(sales_products_params)

        if sale_products.save
          render json: sale_products, status: :created
        else
          render json: { errors: sale_products.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @sale_products.update(sales_products_params)
          render json: @sale_products, status: :ok
        else
          render json: { errors: sale_products.errors.full_message }, status: :unprocessable_entity
        end
      end

      def destroy
        @sale_products.destroy
        head :no_content
      end

      private

      def sales_products_params
        params
          .require(:sale_products)
          .permit(:rate, :quantity, :sale, :product)
      end

      def set_sales_products
        @sale_products = SaleFilter.find_by_id(params[:id])
      end
    end
  end
end
