class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def home
        if logged_in?
        redirect_to user_path(current_user)
        else
        render 'home.html.erb'
        end 
    end 
    
    private 
    def current_user
        @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end 

    def redirect_if_not_logged_in
        redirect_to if !logged_in?
    end

    def current_task
        @task = Task.find_by_id(params[:id])
    end 

    def current_note_task
        @task = Task.find_by_id(params[:task_id])
    end 

    def current_schedule
        @schedule = Schedule.find_by_id(params[:id])
    end 

    def current_task_schedule
        @schedule = Schedule.find_by_id(params[:schedule_id])
    end

    def current_note
        @note = Note.find_by_id(params[:id])
    end 

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

end
