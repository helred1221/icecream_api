# frozen_string_literal: true

module Api
  module V1
    # This is a Address Controller class
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

        if AddressService.save(address)
          render json: address, status: :created
        else
          render json: { errors: address.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if AddressService.update(@address, address_params)
          render json: @address, status: :ok
        else
          render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        AddressService.destroy(@address)
        head :no_content
      end

      private

      def address_params
        params.require(:address).permit(:street, :number, :neighborhood, :city, :zip_code, :user_id)
      end

      def set_address
        @address = AddressFilter.find_by_id(id: params[:id])
        render json: { errors: 'Address not found' }, status: :not_found unless @address
      end
    end
  end
end
