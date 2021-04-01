class NotesController < ApplicationController


    def new
        if params[:task_id] && current_note_task
        @note = current_note_task.notes.build
        else
            flash[:alert] = "That task does not exist."
            redirect_to schedules_path
        end
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
        if current_note
            @note = current_note
         else
            flash[:alert] = "That note does not exist."
            redirect_to schedules_path
         end 
    end

    def edit
        if current_note
            @note = current_note
         else
            flash[:alert] = "That note does not exist."
            redirect_to schedules_path
         end 
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
