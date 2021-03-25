class SchedulesController < ApplicationController
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
        
    end 
end
