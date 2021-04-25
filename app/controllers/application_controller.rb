class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :danger, :info

  protected

  def after_sign_in_path_for(resource)
    if customer_signed_in?
       root_path
    elsif admin_signed_in?
          admin__path
    end
  end

   def after_sign_out_path_for(resource)
      root_path
   end

  # 新規登録の保存機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
  end

end
