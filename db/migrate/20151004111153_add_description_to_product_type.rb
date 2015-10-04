class AddDescriptionToProductType < ActiveRecord::Migration
  def change
    add_column :product_types, :description, :text
  end
end
