class Post < ApplicationRecord
  attachment :image
  
  # validates :image, presence: true
  validates :genre, presence: true
  validates :facility_name, presence: true
  validates :address, presence: true
  validates :review, presence: true
  validates :breakfast_existence, presence: true
  validates :url, presence: true
  
  belongs_to :users, optional: true

end
