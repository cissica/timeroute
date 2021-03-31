class Note < ApplicationRecord
    belongs_to :task
    validates :note_title, :content, presence: true
end
