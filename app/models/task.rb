class Task < ApplicationRecord
    belongs_to :schedule 
    has_many :notes
end
