class ShippingsController < ApplicationController
  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.save
    redirect_to shippings_index_path
  end

  def index
    @shippings = Shipping.all
  end

  def destroy
  end

  def update
  end

  def edit
  end
  
  private

  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name)
  end
  
end
