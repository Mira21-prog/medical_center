class AppointmentsController < ApplicationController
  def index
    if current_user.patient?
      @appointments = current_user.appointments.all
    else
      @appointments = current_user.appointments.open
    end
  end

  def new
    doctor = Doctor.find(params[:doctor_id])
    @appointment = doctor.appointments.build
  end

  def create
    @appointment = Appointment.new(permit_params)
    if @appointment.save
      @appointment.open!
      redirect_to doctors_path
      flash[:success] = "Appointment has been created success"
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:appointment).permit(:comment, :appointment_date, :doctor_id).merge(patient_id: current_user.id)
  end
end
