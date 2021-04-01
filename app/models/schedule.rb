class Schedule < ApplicationRecord
    belongs_to :user 
    belongs_to :category
    has_many :tasks
    has_many :notes, through: :tasks
    validates :title, :description, :category_name, presence: true
    
    def self.in_category(category_id)
        where(category: category_id)
      end

    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
      end
   
    def category_name
        self.category ? self.category.name : nil
    end
end
