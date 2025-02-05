# frozen_string_literal: true

module Api
  module V1
    # This is a Sales Controller class
    class SalesController < ApplicationController
      before_action :set_sale, only: %i[show update destroy]

      def index
        sales = SaleFilter.retrieve_all
        render json: sales, status: :ok
      end

      def show
        render json: @sale, status: :ok
      end

      def create
        sale = Sale.new(sale_params)

        if SaleService.save(sale)
          render json: sale, status: :created
        else
          render json: { errors: sale.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if SaleService.update(@sale, sale_params)
          render json: @sale, status: :ok
        else
          render json: { errors: @sale.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        SaleService.destroy(@sale)
        head :no_content
      end

      private

      def sale_params
        params.require(:sale).permit(:amount, :sale_date, :user_id, sale_products_attributes: %i[product_id quantity rated])
      end

      def set_sale
        @sale = SaleFilter.find_by_id(id: params[:id])
        render json: { errors: 'Sale not found' }, status: :not_found unless @sale
      end
    end
  end
end
