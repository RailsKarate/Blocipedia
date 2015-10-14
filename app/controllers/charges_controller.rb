class ChargesController < ApplicationController

  before_action :validate_role

  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership",
     amount: 15_00
   }
 end

 def create
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   charge = Stripe::Charge.create(
     customer: customer.id, 
     amount: 15_00,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   current_user.update_attribute(:role, 'premium')

   flash[:success] = "Congratulations, #{current_user.email}! Enjoy your new Premium membership."
   redirect_to root_path 
 
   rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
   
 end

  def validate_role
    if current_user
      if current_user.role == 'standard'
        true
      else
        redirect_to wikis_path
        flash[:error] = "#{current_user.email} is already a Premium Member"
      end
    else
      redirect_to new_user_session_path
      flash[:notice] = "You must be signed in to perform that action"
    end
  end

end
