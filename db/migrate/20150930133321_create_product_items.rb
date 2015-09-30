class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.string :name
      t.text :description
      t.decimal :cost, :precision => 8, :scale => 2
      t.references :product_type, index: true

      t.timestamps
    end
  end
end
