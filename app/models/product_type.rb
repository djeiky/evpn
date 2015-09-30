class ProductType < ActiveRecord::Base
  has_many :product_items
end
