class PaymentController < ApplicationController
  before_action :authenticate_user!

  def show
    @title = "Мои заказы - #{@title}"
    @order = Order.find order_params[:order_id]
    @total = 0
    @order.order_items.each do |item|
      @total += item.count * item.price
    end
  end

  private
  def order_params
    params.permit(:order_id)
  end
end
