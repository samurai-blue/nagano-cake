class CustomersController < ApplicationController

  def index
    @customer = current_user
    @customers = Customer.all
  end
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:success] = "登録情報を変更しました"
       redirect_to customer_path
    else
       render :edit and return
    end
  end

  def out
    @customer = current_customer
     @user.update(is_valid: false)
     reset_session
     flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
     redirect_to root_path
  end

  def customer_params
  	params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end


end
