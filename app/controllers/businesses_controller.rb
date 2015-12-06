class BusinessesController < ApplicationController
  def index
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = current_user.businesses.build(business_params)
    @business.user = current_user
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
