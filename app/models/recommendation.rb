class Recommendation < ApplicationRecord
  belongs_to :appointment
  
  validates :comment, presence: true
end
