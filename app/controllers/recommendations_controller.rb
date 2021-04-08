class RecommendationsController < ApplicationController
  def new
    appointment = Appointment.find(params[:appointment_id])
    @recommendation = appointment.build_recommendation
  end

  def create
    @appointment = Appointment.find(params[:recommendation][:appointment_id])
    @recomendation = Recommendation.new(permit_params)
    binding.pry
    if @recomendation.save
      redirect_to appointments_path
      flash[:success] = "Recommendation was been created success"
    else
      render 'new'
    end
  end
  private

  def permit_params
    params.require(:recommendation).permit(:comment).merge(appointment: @appointment )
  end
end
