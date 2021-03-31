class TasksController < ApplicationController
    def new
        @schedule = current_schedule
        @task = Task.new
    end 

    def create
        @task = current_schedule.tasks.build(task_params)
        if @task.save
            redirect_to schedule_path(current_schedule)
        else 
            render 'tasks/new.html.erb'
            #with error messages
        end 
    end 

    def edit
        @task = current_task
    end 

    def update
        current_task.update(task_params)
        redirect_to schedule_path(current_task.schedule_id)
    end 

    def show
        @task = current_task
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
