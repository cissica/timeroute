class User < ApplicationRecord
    has_secure_password
    has_many :schedules
    has_many :categories, through: :schedules
    has_many :tasks, through: :schedules

    def self.create_from_google(auth)
        User.find_or_create_by(email: auth[:info][:email]) do |u|
        u.name = auth[:info][:first_name]
        u.email = auth[:info][:email]
        u.password = SecureRandom.hex(11)
        end 
    end
end
