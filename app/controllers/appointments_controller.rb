class AppointmentsController < ApplicationController

  def index
  @appointments = Appointments.all
  @user = current_user
  end

  def new 
   @appointment = Appointment.new
  end

  def create
    @business = Business.find(params[:business_id])
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      @appointment.update_attributes(:business_id => @business.id, :available => true)
      flash[:notice] = "Appointment created!"
      redirect_to @business
    else
      flash[:error] = "There was an error saving the appointment. Please try again."
    end
  end

  def make_unavailable
    @appointment = Appointment.find_by_id(params[:id])
    @business = Business.find_by_id(params[:business_id])
    @appointment.update_attributes(:available => false, :user_id => current_user.id)
  end


  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :business_id)
  end


end

