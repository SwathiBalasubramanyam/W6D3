# app/controllers/users_controller.rb

class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        begin
            # debugger
            parameters = params.require(:user).permit(:name, :email)
            user_instance = User.new(parameters)
        # replace the `user_attributes_here` with the actual attribute keys
            user_instance.save!
        rescue => exception

            render json: exception.message
        else 
            render json: user_instance
        end
    end

    def show
        puts params
    end

end