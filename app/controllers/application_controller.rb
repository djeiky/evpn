class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include BreadcrumbHelper

  protect_from_forgery with: :exception

  before_filter :retrieve_menus


  private

  def is_admin?
    if user_signed_in? and current_user.admin?
      true
    else
      redirect_to "/users/sign_in"
    end
  end

  def retrieve_menus
    @menus = Menu.all
  end

  def current_cart
    Cart.find session[:cart_id]
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def after_sign_in_path_for(resource)

  end

end
