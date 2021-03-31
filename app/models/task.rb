class Task < ApplicationRecord
    belongs_to :schedule 
    has_many :notes
    validates :task_title, :description, :when, presence: true   
end
