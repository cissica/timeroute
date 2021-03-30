class User < ApplicationRecord
    has_secure_password
    has_many :schedules
    has_many :categories, through: :schedules
    has_many :tasks, through: :schedules
end
