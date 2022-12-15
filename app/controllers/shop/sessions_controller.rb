# frozen_string_literal: true

class Shop::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    before_action :shop_state, only: [:create]


  def shop_state
    @shop = Shop.find_by(email: params[:shop][:email])
    return if !@shop
    if @shop.valid_password?(params[:shop][:password]) && @shop.is_deleted
      redirect_to new_shop_registration_path
    end
  end

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
  def after_sign_in_path_for(resource)
    shop_shops_my_shop_path
  end

  def after_sign_out_path_for(resource)
    new_shop_session_path
  end
end
