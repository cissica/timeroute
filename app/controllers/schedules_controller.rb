class SchedulesController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @schedule = Schedule.new
    end 

    def create 
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            redirect_to schedules_path
        else 
            render 'schedules/new.html.erb'
            #with error messages
        end 
    end 

    def index
        #show all schcedules that belong to current user
    end 

    private 
    def schedule_params
        params.require(:schedule).permit(:title,:day)
    end 
end
