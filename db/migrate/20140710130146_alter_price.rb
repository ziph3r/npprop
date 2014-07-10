class AlterPrice < ActiveRecord::Migration
  def change
  		change_column :products, :sell_price, :string
  		change_column :products, :land_price, :string
  		change_column :products, :rent_price, :string
  		change_column :products, :sqr_area, :string
  		change_column :products, :depth, :string
  		change_column :products, :width, :string
  end
end
