class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cart_items = CartItem.all
    respond_with(@cart_items)
  end

  def show
    respond_with(@cart_item)
  end

  def new
    @cart_item = CartItem.new
    respond_with(@cart_item)
  end

  def edit
  end

  def create
    if cart_item_params[:count].to_i > 0
      @cart = current_cart
      item = ProductItem.find_by_id cart_item_params[:product_item_id]

      @cart_item = @cart.add_product(item.id, cart_item_params[:count])  #@cart.cart_items.build(product_item_id: item, count: cart_item_params[:count])

      @cart_item.save
    end
    redirect_to product_types_path
  end

  def update
    @cart_item.update(cart_item_params)
    respond_with(@cart_item)
  end

  def destroy
    @cart_item.destroy
    respond_with(@cart_item)
  end

  private
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    def cart_item_params
      params.permit(:count, :cart_id, :product_item_id)
    end
end
