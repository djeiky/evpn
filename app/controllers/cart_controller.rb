class CartController < ApplicationController

  def show
    @cart = current_cart
    @title = "Корзина - #{@title}"
    @left_menus = Menu.where(:name => "cabinet_menu").first

  end
end
