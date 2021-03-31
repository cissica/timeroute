class NotesController < ApplicationController

    def new
       @task = current_note_task
       @note = Note.new
       
    end

    def create
        @note = current_note_task.notes.build(notes_params)
        if @note.save
        redirect_to task_path(current_note_task)
        else 
        render :template => "notes/new"
        end 
    end 

    def show
        @note = current_note
    end

    def edit
        @note = current_note
    end

    def update
        current_note.update(notes_params)
        redirect_to task_path(current_note.task_id)
    end 

    def destroy
        @note = Note.find(params[:id]).destroy
        redirect_to schedules_path
    end 

    private 

    def notes_params
        params.require(:note).permit(:content, :task_id, :note_title)
    end
end
