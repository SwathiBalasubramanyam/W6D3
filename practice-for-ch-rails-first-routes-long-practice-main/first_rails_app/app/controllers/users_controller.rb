# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        begin
            user_instance = User.new(user_params)
            user_instance.save!
        rescue => exception
            render json: exception.message if user_instance.nil?
            render json: user_instance.errors.full_messages, status: :unprocessable_entity
        else 
            render json: user_instance
        end
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end

    def show
        render json: User.find_by(id: params[:id])
    end

end