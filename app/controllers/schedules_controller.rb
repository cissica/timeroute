class SchedulesController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @schedule = Schedule.new
    end 

    def create 
        @schedule = current_user.schedules.build(schedule_params)
        if @schedule.save
            redirect_to schedule_path(@schedule)
        else 
            render 'schedules/new.html.erb'
            #with error messages
        end 
    end 

    def edit
        @schedule = Schedule.find_by_id(params[:id])
    end 

    def update
        schedule = Schedule.find(params[:id])
        schedule.update(schedule_params)
        redirect_to schedule_path(schedule)
    end 

    def show 
        @schedule = Schedule.find_by_id(params[:id])
    end

    def index
        @schedules = current_user.schedules
    end 

    def destroy
        Schedule.find(params[:id]).destroy
        redirect_to schedules_path
    end 

    private 
    def schedule_params
        params.require(:schedule).permit(:title, :day, :schedule_type, :user_id)
    end 
end
