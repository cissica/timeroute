class Schedule < ApplicationRecord
    belongs_to :user 
    belongs_to :category
    has_many :tasks
    has_many :notes, through: :tasks
    validates :title, :description, :category_name, presence: true
    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
      end
   
    def category_name
        self.category ? self.category.name : nil
    end
end
