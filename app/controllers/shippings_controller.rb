class ShippingsController < ApplicationController
  
  def index
    @shipping = Shipping.new
    @shippings = Shipping.all
  end
  
  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      redirect_to shippings_index_path, notice: "You have created book successfully."
    else
       @shippings = Shipping.all
      render 'index'
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to shippings_index_path
  end

  def update
    @shipping = Shipping.find(params[:id])
    @shipping.update(shipping_params)
    redirect_to shippings_index_path
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end
  
  
  private

  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name)
  end
  
end
