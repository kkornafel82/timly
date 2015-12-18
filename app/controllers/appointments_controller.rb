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
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      @appointment.update_attributes(:business_id => @business.id, :available => true)
      flash[:notice] = "Appointment created!"
      redirect_to @business
    else
      flash[:error] = "There was an error saving the appointment. Please try again."
    end
  end

  def make_unavailable
    @appointment = Appointment.find(params[:appointment_id])
    @business = @appointment.business
    @appointment.update_attributes(:available => false, :user_id => current_user.id)
  end

  def make_available
    @appointment = Appointment.find(params[:id])
    @business = @appointment.business
    @appointment.update_attributes(:available => true, :user_id => nil)
  end



  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :business_id)
  end


end

