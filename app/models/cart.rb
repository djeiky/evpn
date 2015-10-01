class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def add_product product_id, count
    current_item = cart_items.find_by_product_item_id product_id
    if current_item
      current_item.count = count
    else
      current_item = cart_items.build(product_item_id: product_id, count: count)
    end
    current_item

  end


end
