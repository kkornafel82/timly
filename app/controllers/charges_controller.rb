class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Timly Membership - #{current_user.email}",
     amount: 10_00
   }
  end

  def create
 
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 10_00,
     description: "Timly Membership - #{current_user.email}",
     currency: 'usd'
   )
   
   current_user.update_attribute(:role, 'premium')
   flash[:notice] = "Thank you, #{current_user.email}! Enjoy your premium membership."
   redirect_to root_path # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end
end