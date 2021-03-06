class OrdersController < ApplicationController

  before_action :set_order, only: [:show]

  def create
    if !user_signed_in?
      redirect_to new_user_session_path
      return
    end

    @cart = current_cart
      user = User.find_by_id current_user.id

    if !@cart.is_empty?
      order = user.orders.build

      @cart.cart_items.each do |item|
      order.order_items.build(product_item_id: item.product_item_id, price: item.product_item.cost, count: item.count)

      end
    end
    user.save
    @cart.destroy
    redirect_to order_path(order)

  end

  def show
    @title = "Счета - #{@title}"
    @left_menus = Menu.where(:name => "cabinet_menu").first

  end

  def index
    @orders = Order.where(:user_id => current_user.id)
    @title = "Счета - #{@title}"
     @left_menus = Menu.where(:name => "cabinet_menu").first

  end

  private

  def set_order
    @order = Order.find params[:id]
  end


  def order_params

  end


end
