class Plan < ApplicationRecord
    
    validates :time, presence: true
    validates :schedule, presence: true
    validates :city_name, presence: true

    belongs_to :users, optional: true
    
end
