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
        if current_schedule
            @schedule = current_schedule
         else
            flash[:alert] = "That schedule does not exist."
            redirect_to schedules_path
         end 
    end 

    def update
        current_schedule.update(schedule_params)
        redirect_to schedule_path(current_schedule)
    end 

    def show 
         if current_schedule
            @schedule = current_schedule
         else
            flash[:alert] = "That schedule does not exist."
            redirect_to schedules_path
         end 
    end

    def index
        @categories = Category.all
        if !params[:category].blank?
            @schedules = Schedule.in_category(params[:category])
          else
            @schedules = Schedule.all
          end
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
