
class UsersController < ApplicationController
    def new
        @user = User.new
    end 

    def create
        @user = User.new(post_params)
        @user.save
        redirect_to @user
    end 

    def show
        
    end 

    private 
    def post_params
        params.require(:user).permit(:name)
    end
end
