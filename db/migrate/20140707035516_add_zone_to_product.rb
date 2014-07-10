class AddZoneToProduct < ActiveRecord::Migration
  def change
  	 add_column :products, :zone_id, :integer
  end
end
