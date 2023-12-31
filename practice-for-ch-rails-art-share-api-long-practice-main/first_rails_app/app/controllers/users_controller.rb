# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        if params[:username]
            render json: User.users_by_username(params[:username])
        else
            render json: User.all
        end
    end

    def create
        begin
            user_instance = User.new(user_params)
            user_instance.save!
        rescue => exception
            render json: exception.message if user_instance.nil?
            render json: user_instance.errors.full_messages, status: :unprocessable_entity
        else 
            render json: user_instance, status: :created
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to user_url(user)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy(params[:id])
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end