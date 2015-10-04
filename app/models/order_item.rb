class OrderItem < ActiveRecord::Base
  belongs_to :product_item
  belongs_to :order
end
