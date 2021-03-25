
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
            #render signup form again with error messages 
        end 
    end 

    def show
        redirect_if_not_logged_in
        @user = User.find_by(params[:id])
    end 

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
