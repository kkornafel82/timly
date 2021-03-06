class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    authorize @businesses
  end

  def show
    @business = Business.find(params[:id])
    @appointment = Appointment.new
    @appointments = Appointment.all
    authorize @business
  end

  def new
    @business = Business.new
    @appointment = Appointment.new
  end

  def create
    @business = current_user.businesses.build(business_params)
    @business.user = current_user
    authorize @business
    if @business.save
      flash[:notice] = "Business created!"
      redirect_to @business
    else
      flash[:error] = "There was an error saving the business. Please try again."
    end
  end

  def edit
  end

  private

  def business_params
    params.require(:business).permit(:name, :trade, :address)
  end
end
