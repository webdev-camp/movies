class ChargesController < AuthenticatedController
  before_action :set_dvd

  def new
    @charge = Charge.new
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    #retrieve customer id if existing customer. Stripe::Charge.retrieve(customer_id)
    current_user.customer_id = customer.id
    current_user.save!

    stripe_charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@dvd.price*100),
      :description => @dvd.card.movie.title,
      :currency    => 'eur'
    )
    charge = Charge.new(
      user_id: current_user.id,
      amount: (@dvd.price*100),
      description: stripe_charge.description,
      purchase_id: 1,
      currency: "eur",
      stripe_id: stripe_charge.id,
    )
    charge.save!
    @dvd.purchase.finalize!

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def set_dvd
      purchases = Purchase.current.where(buyer: current_user)
      if purchases.length != 1
        redirect_to root_path
      end
      @dvd = purchases.first.dvd
    end
end
