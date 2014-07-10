class AddProvinceIdToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :province_id, :integer
  end
end
