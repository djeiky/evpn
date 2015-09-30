class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :phone, :string
    add_column :users, :legal_entity, :boolean, :default => false
  end
end
