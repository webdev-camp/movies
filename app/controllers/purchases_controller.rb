class PurchasesController < AuthenticatedController

  def create
    card = Card.find(params[:card_id])
    Purchase.create! buyer: current_user, dvd_id: card.dvd_id
    redirect_to new_address_path
  end

end
