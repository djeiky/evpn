class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :count
      t.references :cart, index: true
      t.references :product_item, index: true

      t.timestamps
    end
  end
end
