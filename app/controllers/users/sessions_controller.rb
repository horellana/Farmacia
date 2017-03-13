class Users::SessionsController < Devise::SessionsController
  before_action :check_open_box!, only: :destroy
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
  def destroy
      super
  end

  private
  def check_open_box!
    if Box.get_box.active?
      return redirect_to root_path, alert: 'Falta cerrar la caja!'
    else
      super
    end
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
