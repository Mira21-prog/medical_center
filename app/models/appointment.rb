class Appointment < ApplicationRecord
  belongs_to :patient, class_name: "Patient"
  belongs_to :doctor, class_name: "Doctor"
end
