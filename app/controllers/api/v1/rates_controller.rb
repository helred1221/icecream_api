# frozen_string_literal: true

module Api
  module V1
    # This is a Rates Controller class
    class RatesController < ApplicationController
      before_action :set_rate, only: %i[show update destroy]

      def index
        rates = RateFilter.retrieve_all
        render json: rates, status: :ok
      end

      def show
        render json: @rate, status: :ok
      end

      def create
        rate = Rate.new(rate_params)

        if RateService.save(rate)
          render json: rate, status: :created
        else
          render json: { errors: rate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if RateService.update(@rate, rate_params)
          render json: @rate, status: :ok
        else
          render json: { errors: @rate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        RateService.destroy(@rate)
        head :no_content
      end

      private

      def rate_params
        params.require(:rate).permit(:star, :comment, :product_id, :user_id)
      end

      def set_rate
        @rate = RateFilter.find_by_id(id: params[:id])
        render json: { errors: 'Rate not found' }, status: :not_found unless @rate
      end
    end
  end
end
