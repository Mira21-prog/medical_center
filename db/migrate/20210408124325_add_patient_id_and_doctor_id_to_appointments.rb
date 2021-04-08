class AddPatientIdAndDoctorIdToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :doctor_id, :integer, null: false, foreign_key: true
    add_column :appointments, :patient_id, :integer, null: false, foreign_key: true
    add_column :appointments, :appointment_date, :datetime, null: false
    add_column :appointments, :comment, :string
  end
end
