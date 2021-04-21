class ShippingsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @shipping = Shipping.new
    @shippings = current_customer.shippings
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      redirect_to customer_shippings_path, notice: "新規配送先を登録しました"
    else
       @shippings = current_customer.shippings
      render 'index'
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    redirect_to customer_shippings_path
  end

  def update
    @shipping = Shipping.find(params[:id])
    @shipping.update(shipping_params)
    redirect_to customer_shippings_path
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end


  private

  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name)
  end

end
