class Appointment < ApplicationRecord
  belongs_to :patient, class_name: "Patient"
  belongs_to :doctor, class_name: "Doctor"
  has_one :recommendation, dependent: :destroy
  validates :appointment_date, :comment, presence: true
  enum status: { open: 0, close: 1 }
  scope :open, -> { where(status: 'open')}
end
