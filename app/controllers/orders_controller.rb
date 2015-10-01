class OrdersController < ApplicationController

  def create
    if !current_user
      redirect_to new_user_session_path
    end

    @cart = current_cart
    order = current_user.orders.build
    @cart.cart_items.each do |item|
      order.order_items.build(product_item_id: item.product_item_id, price: item.cost, count: item.count)

    end

    current_user.save



  end

  def index
  end
end
