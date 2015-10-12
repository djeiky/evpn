class ProductTypesController < ApplicationController
  def index
    add_breadcrumb "Тарифы", product_types_path
    @product_types = ProductType.all
    @cart_items = current_cart.cart_items
    @title = "Тарифы - #{@title}"
  end

  def description
    @product_types = ProductType.all
    @title = "Облачные сервисы SaaS - #{@title}"
  end
end
