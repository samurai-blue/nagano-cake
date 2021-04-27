class ShippingsController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_customer
  
  def index
    @shipping = Shipping.new
    @shippings = @customer.shippings
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      redirect_to customer_shippings_path, notice: "新規配送先を登録しました"
    else
       @shippings = @customer.shippings
       flash[:danger] = '入力内容をご確認ください。'
      render 'index'
    end
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.destroy
    flash[:info] = '登録した住所を削除しました。'
    redirect_to customer_shippings_path
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      flash[:success] = '住所情報を更新しました！'
      redirect_to customer_shippings_path
    else
       flash[:danger] = '入力内容をご確認ください。'
      render :edit
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end


  private
  
  def set_customer
    @customer = current_customer
  end
  
  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :name)
  end

end
