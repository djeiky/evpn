class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product_item, index: true
      t.decimal :price, precision: 8, scale: 2
      t.integer :count

      t.timestamps
    end
  end
end
