class AddressesController < ApplicationController
    module Api
        module V1
          class AddressesController < ApplicationController
            before_action :set_address, only: %i[show update destroy]
      
            def index
              addresses = AddressFilter.retrieve_all
              render json: addresses, status: :ok
            end
      
            def show
              render json: @address, status: :ok
            end
      
            def create
              address = Address.new(address_params)
      
              if address.save
                render json: address, status: :created
              else
                render json: { errors: address.errors.full_message }, status: :unprocessable_entity
              end
            end
      
            def update
              if @address.update(address_params)
                render json: @address, status: :ok
              else
                render json: { errors: address.errors.full_message }, status: :unprocessable_entity
              end
            end
      
            def destroy
              @address.destroy
              head :no_content
            end
      
            private
      
            def address_params
              params
                .require(:address)
                .permit(:street, :house_number, :neighborhood, :city, :zip_code)
            end
      
            def set_address
              @address = AddressFilter.find_by_id(params[:id])
            end
      
          end
        end
      end
end
