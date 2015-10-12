class CartController < ApplicationController

  def show
    @cart = current_cart
    @title = "Корзина - #{@title}"
  end
end
