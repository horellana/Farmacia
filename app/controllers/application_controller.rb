class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :rut
    devise_parameter_sanitizer.for(:sign_in) << :rut
  end

  def current_office
    current_user.office
  end

  def setup_cart
    begin
      @cart = Cart.find session[:cart_id]
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end
  end

  def clean_cart
    cart = Cart.find session[:cart_id]

    # Restauro el stock de los productos
    # si es que no se hizo una transaccion
    # cart.drop unless cart.transactionn

    unless cart.transactionn
      cart.drop
      cart.destroy
    end

    session[:cart_id] = nil
    session[:client_rut] = nil
  end

  def admin_only
    if current_user.nil?
      return redirect_to root_path, alert: 'No eres administrador'
    end

    if not current_user.admin?
      redirect_to root_path, alert: 'No eres administrador'
    end
  end
end
