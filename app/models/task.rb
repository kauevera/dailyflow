class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  
  validates :titulo, presence: true
end