class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product_item
end
