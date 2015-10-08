class AddImageToProductType < ActiveRecord::Migration
  def change
    add_attachment :product_types, :image
  end
end
