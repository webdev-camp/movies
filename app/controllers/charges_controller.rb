class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 500
    #create customer if new customer
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    #retrieve customer id if existing customer. Stripe::Charge.retrieve(customer_id)
    current_user.customer_id = customer.id
    current_user.save!

    stripe_charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    charge = Charge.new(
      customer: :customer.id,
      user_id: :current_user.id,
      amount: @amount,
      description: "Testing",
      purchase_id: 1,
      currency: "eur",
      stripe_id: :stripe_charge.id,
    )

    charge.save!

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
# put customer id attribute on the user,
# CHARGE table with user id, amount, description, purchase id, currency
# save the charge id in the database
# put publishable key in code from bash
