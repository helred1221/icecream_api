class Api::V1::RatesController < ApplicationController
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
      
              if rate.save
                render json: rate, status: :created
              else
                render json: { errors: rate.errors.full_message }, status: :unprocessable_entity
              end
            end
      
            def update
              if @rate.update(rate_params)
                render json: @rate, status: :ok
              else
                render json: { errors: rate.errors.full_message }, status: :unprocessable_entity
              end
            end
      
            def destroy
              @rate.destroy
              head :no_content
            end
      
            private
      
            def rate_params
              params
                .require(:rate)
                .permit(:star, :comment)
            end
      
            def set_rate
              @rate = RateFilter.find_by_id(params[:id])
            end
end
