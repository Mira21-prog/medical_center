class RecommendationsController < ApplicationController
  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    appointment = Appointment.find(params[:appointment_id])
    @recommendation = appointment.build_recommendation
  end

  def create
    @appointment = Appointment.find(params[:recommendation][:appointment_id])
    @recommendation = @appointment.build_recommendation(permit_params)
    if @recommendation.save
      @appointment.close!
      redirect_to appointments_path
      flash[:success] = "Recommendation has been created success"
    else
      render 'new'
    end
  end
  private

  def permit_params
    params.require(:recommendation).permit(:comment)
  end
end
