class ProductItem < ActiveRecord::Base
  belongs_to :product_type
  has_many :cart_items

end
