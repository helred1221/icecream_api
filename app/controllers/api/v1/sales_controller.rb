class SalesController < ApplicationController
    module Api
        module V1
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
      
              if sale.save
                render json: sale, status: :created
              else
                render json: { errors: sale.errors.full_message }, status: :unprocessable_entity
              end
            end
      
            def update
              if @sale.update(sale_params)
                render json: @sale, status: :ok
              else
                render json: { errors: sale.errors.full_message }, status: :unprocessable_entity
              end
            end
      
            def destroy
              @sale.destroy
              head :no_content
            end
      
            private
      
            def sale_params
              params
                .require(:sale)
                .permit(:sale_date, :user)
            end
      
            def set_sale
              @sale = SaleFilter.find_by_id(params[:id])
            end
      
          end
        end
      end
end