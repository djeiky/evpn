class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :cost, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
