class AppointmentsController < ApplicationController
  before_action :find_user

  def index
    @appointment = Appointment.all
  end

  def show
  end

  def new
    doctor = Doctor.find(params[:doctor_id])
    @appointment = doctor.appointments.build
  end

  def create
    @appointment = Appointment.new(permit_params)
    if @appointment.save
      redirect_to doctors_path
      flash[:success] = "Appointment was been created success"
    else
      render 'new'
    end
  end

  private

  def find_user
    @user = current_user
  end

  def permit_params
    params.require(:appointment).permit(:comment, :appointment_date, :doctor_id).merge(patient_id: @user.id)
  end

end
