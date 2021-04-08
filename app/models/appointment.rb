class Appointment < ApplicationRecord
  belongs_to :patient, class_name: "Patient"
  belongs_to :doctor, class_name: "Doctor"
  has_one :recommendation, dependent: :destroy
  enum status: { open: 0, close: 1 }
  scope :open, -> { where(status: 'open')}
end
