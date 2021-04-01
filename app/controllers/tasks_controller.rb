class TasksController < ApplicationController
    def new
        if params[:schedule_id] && current_task_schedule
            @task = current_task_schedule.tasks.build
            else
                flash[:alert] = "That schedule does not exist."
                redirect_to schedules_path
            end
    end 

    def create
        @task = current_task_schedule.tasks.build(task_params)
        if @task.save
            redirect_to schedule_path(current_task_schedule)
        else 
            render 'tasks/new.html.erb'
            #with error messages
        end 
    end 

    def edit
        if current_task
            @task = current_task
         else
            flash[:alert] = "That task does not exist."
            redirect_to schedules_path
         end 
    end 

    def update
        current_task.update(task_params)
        redirect_to edit_schedule_path(current_task.schedule_id)
    end 

    def show
        if current_task
            @task = current_task
         else
            flash[:alert] = "That task does not exist."
            redirect_to schedules_path
         end 
    end 


    def destroy
        @schedule = current_task.schedule_id
        current_task.destroy
        redirect_to schedule_path(@schedule)
    end 

    private 
    def task_params
        params.require(:task).permit(:task_title, :description, :schedule_id, :when)
    end 

end
