class ProductSearchPrice < ActiveRecord::Migration
  def change
  	add_column :products, :search_price, :float
  end
end
