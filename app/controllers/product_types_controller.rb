class ProductTypesController < ApplicationController
  def index
    add_breadcrumb "Тарифы", product_types_path
    @product_types = ProductType.all
  end
end
