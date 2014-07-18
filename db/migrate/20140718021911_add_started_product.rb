class AddStartedProduct < ActiveRecord::Migration
  def change
  	add_column :products, :is_starred, :boolean, :default => false
  end
end
