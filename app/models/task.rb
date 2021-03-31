class Task < ApplicationRecord
    belongs_to :schedule 
    has_many :notes
    validates :task_title, :description, :when, presence: true  
    
    scope :display_by_when, -> { order(:when) }
end
