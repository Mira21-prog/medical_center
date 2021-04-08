class Category < ApplicationRecord
  validates :name, presence: true
  has_many :doctors, dependent: :destroy
end
