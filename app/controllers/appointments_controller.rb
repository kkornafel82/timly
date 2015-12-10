class AppointmentsController < ApplicationController

  def index
  @appointments = Appointments.all
  @user = current_user
  end

  def new 
   @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @business = Business.find(params[:business_id])
    if @appointment.save
      flash[:notice] = "Appointment created!"
      redirect_to @business
    else
      flash[:error] = "There was an error saving the appointment. Please try again."
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :business_id)
  end


end

