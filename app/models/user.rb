class User < ApplicationRecord
    has_many :schedules
    has_many :notes
    has_many :tasks, through: :schedules
end
