class AddressesController < AuthenticatedController

def show
  @address = current_user.address
end

def new
  if current_user.address
    redirect_to new_charge_path
  end
  @address = Address.new
end

def create
  @address = Address.new(address_params)
  @address.user = current_user
  respond_to do |format|
    if @address.save
      format.html { redirect_to new_charge_path, notice: 'Address was successfully created.' }
      format.json { render :show, status: :created, location: @address }
    else
      format.html { render :new }
      format.json { render json: @address.errors, status: :unprocessable_entity }
    end
  end
end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def address_params
    params.require(:address).permit(:street, :postcode, :city, :country)
  end

end
