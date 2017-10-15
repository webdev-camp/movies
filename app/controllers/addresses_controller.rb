class PurchaseController < AuthenticatedController
  
def show
  @address = Address.find(params[:id])
end

def new
  @address = Address.new
end

def create
  @address = Address.new(address_params)
  @address.user = current_user
  respond_to do |format|
    if @address.save
      format.html { redirect_to @address, notice: 'Address was successfully created.' }
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
    params.require(:address).permit(:Street, :Postcode, :City, :Country, :user)
  end
end
