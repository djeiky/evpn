class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include BreadcrumbHelper

  protect_from_forgery with: :exception

  before_filter :retrieve_menus
  before_action :set_title
  before_action :set_cart_total_items

  private

  def set_title
    @title = "e-vpn.ru"
  end


  def is_admin?
    if user_signed_in? and current_user.admin?
      true
    else
      redirect_to "/users/sign_in"
    end
  end

  def retrieve_menus
    @main_menus = Menu.where(:name => "security").first
    @left_menus = Menu.where(:name => "left_menu").first
  end

  def current_cart
    Cart.find session[:cart_id]
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def set_cart_total_items
    cart = current_cart
    @total_cart_items = 0
    if cart.cart_items
      cart.cart_items.each do |item|
        @total_cart_items += item.count
      end
    end
  end

  def after_sign_in_path_for(resource)
    @cart = current_cart
    if !@cart.is_empty?
      user = User.find_by_id current_user.id
      @order = user.orders.build
      @cart.cart_items.each do |item|
        @order.order_items.build(product_item_id: item.product_item_id, price: item.product_item.cost, count: item.count)

      end

      user.save
      @cart.destroy
      return order_url @order
    else
      return root_url
    end

  end

end
