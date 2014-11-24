 class ChargesController < ApplicationController
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
     amount: 1000,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
 
    
   
    #@user = User.find(params[:id])
    #@user.role = "premium" #or use update_attributes

   current_user.update! role: :premium
   #current_user.role = "premium"
   #current_user.save!
   
   flash[:success] = "Thank you for supporting us, #{current_user.email}!"
   redirect_to root_path # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end


  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user}",
     amount: 1000
   }
 end

end