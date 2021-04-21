# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController

  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_customer
    # ログイン時に入力された"email"に対応するユーザーが存在するか探しています。
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      # 入力されたパスワードが正しいことを確認しています。
      #@customer.active_for_authentication? == false) ==> ログインユーザーが有効では無い状態（退会している）
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:notice] = "このアカウントは退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
