class Appointment < ApplicationRecord
  belongs_to :patient, class_name: "Patient"
  belongs_to :doctor, class_name: "Doctor"
  has_one :recommendation, dependent: :destroy

  validates :appointment_date, :comment, presence: true

  scope :open, -> { where(status: 'open')}
  
  enum status: { open: 0, close: 1 }
end
