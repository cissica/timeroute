class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def home
        @user = current_user
    end 
    
    private 
    def current_user
        @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end 

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end

    def current_task
        Task.find_by_id(params[:id])
    end 

    def current_note_task
        Task.find_by_id(params[:task_id])
    end 

    def current_schedule
        Schedule.find(params[:schedule_id])
    end 

    def current_note
        Note.find(params[:id])
    end 

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
