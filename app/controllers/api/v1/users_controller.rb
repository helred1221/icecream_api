# frozen_string_literal: true

module Api
  module V1
    # This is a Users Controller class
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update destroy]

      def index
        users = UserFilter.retrieve_all
        render json: users, status: :ok
      end

      def show
        render json: @user, status: :ok
      end

      def create
        user = User.new(user_params)

        if user.save
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_message }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: { errors: user.errors.full_message }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        head :no_content
      end

      private

      def user_params
        params
          .require(:user)
          .permit(:name, :gender, :email, :password, :role, :address)
      end

      def set_user
        @user = UserFilter.find_by_id(params[:id])
      end
    end
  end
end
