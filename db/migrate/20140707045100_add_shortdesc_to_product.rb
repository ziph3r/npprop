class AddShortdescToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :short_desc, :text
  end
end
