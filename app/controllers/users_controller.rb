
class UsersController < ApplicationController
    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to login_path
        else
            render 'users/new.html.erb'
        end 
    end 

    def edit
        @user = current_user
    end 

    def update
        @user = current_user
        @user.update(user_params)
        redirect_to user_path(@user)
    end 

    def show
        redirect_if_not_logged_in
        @user = current_user
        
    end 

    def destroy
        current_user.destroy
        redirect_to '/'
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password, :goal)
    end
end
