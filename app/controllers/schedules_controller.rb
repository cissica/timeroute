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
        @schedule = current_schedule
    end 

    def update
        current_schedule.update(schedule_params)
        redirect_to schedule_path(current_schedule)
    end 

    def show 
        @schedule = current_schedule
    end

    def index
        @schedules = current_user.schedules
    end 

    def destroy
        current_schedule.destroy
        redirect_to schedules_path
    end 

    private 
    def schedule_params
        params.require(:schedule).permit(:title, :daily, :weekly, :user_id, :description, :category_name)
    end 
end
