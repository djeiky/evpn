class OrdersController < ApplicationController

  before_action :authenticate_user! , only: [:index, :show]
  before_action :set_order, only: [:show]
  before_action :set_menus, only: [:show, :index]


  def create
    if !user_signed_in?
      redirect_to new_user_session_path
      return
    end

    @cart = current_cart
    user = User.find_by_id current_user.id
    order = user.orders.build

    @cart.cart_items.each do |item|
      order.order_items.build(product_item_id: item.product_item_id, price: item.product_item.cost, count: item.count)

    end

    user.save
    @cart.destroy


  end

  def show
  end

  def index
    @orders = Order.where(:user_id => current_user.id)
  end

  private

  def set_order
    @order = Order.find params[:id]
  end

  def set_menus
    @left_menus = Menu.where(:name => "cabinet_menu").first
  end

  def order_params

  end
end
