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


end
