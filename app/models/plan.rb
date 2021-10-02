class Plan < ApplicationRecord
    
    validates :time, presence: true
    validates :schedule, presence: true
    validates :meal, presence: true
    validates :city_name, presence: true
    validates :lodgment_target_name, presence: true

    belongs_to :users, optional: true
    
end
