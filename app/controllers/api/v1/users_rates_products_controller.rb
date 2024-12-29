# frozen_string_literal: true

module Api
  module V1
    # This is a user_rate_products Controller class
    class UsersRatesProductsController < ApplicationController
      before_action :set_user_rate_products, only: %i[show update destroy]

      def index
        user_rate_products = UsersRatesProductsFilter.retrieve_all
        render json: user_rate_products, status: :ok
      end

      def show
        render json: @user_rate_products, status: :ok
      end

      def create
        user_rate_products = UsersRatesProducts.new(user_rate_products_params)

        if user_rate_products.save
          render json: user_rate_products, status: :created
        else
          render json: { errors: user_rate_products.errors.full_message }, status: :unprocessable_entity
        end
      end

      def update
        if @user_rate_products.update(user_rate_products_params)
          render json: @user_rate_products, status: :ok
        else
          render json: { errors: user_rate_products.errors.full_message }, status: :unprocessable_entity
        end
      end

      def destroy
        @user_rate_products.destroy
        head :no_content
      end

      private

      def user_rate_products_params
        params
          .require(:user_rate_products)
          .permit(:user, :product, :rate)
      end

      def set_user_rate_products
        @user_rate_products = UserFilter.find_by_id(params[:id])
      end
    end
  end
end
