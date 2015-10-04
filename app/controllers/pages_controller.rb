class PagesController < ApplicationController
  def index
#    @products = Product.all
  end

  def cabinet
    if user_signed_in?
      @left_menus = Menu.where(:name => "cabinet_menu").first
      render "cabinet"
    else
      redirect_to new_user_session_path
    end
  end
end
