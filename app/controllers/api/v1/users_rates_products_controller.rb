# frozen_string_literal: true

module Api
  module V1
    # This is a user_rate_products Controller class
    class UsersRatesProductsController < ApplicationController
      before_action :set_user_rate_products, only: %i[show update destroy]

      def index
        user_rate_products = UserRateProductFilter.retrieve_all
        render json: user_rate_products, status: :ok
      end

      def show
        render json: @user_rate_products, status: :ok
      end

      def create
        user_rate_products = UsersRatesProducts.new(user_rate_products_params)

        if UsersRatesProductsService.save(user_rate_products)
          render json: user_rate_products, status: :created
        else
          render json: { errors: user_rate_products.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if UsersRatesProductsService.update(@user_rate_products, user_rate_products_params)
          render json: @user_rate_products, status: :ok
        else
          render json: { errors: user_rate_products.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        UsersRatesProductsService.destroy(@user_rate_products)
        head :no_content
      end

      private

      def user_rate_products_params
        params.require(:user_rate_products).permit(:user, :product, :rate)
      end

      def set_user_rate_products
        @user_rate_products = UserRateProductFilter.find_by_id(id: params[:id])
        render json: { errors: 'Rated Product by User not found' }, status: :not_found unless @user_rate_products
      end
    end
  end
end
