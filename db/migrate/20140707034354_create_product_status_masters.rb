class CreateProductStatusMasters < ActiveRecord::Migration
  def change
    create_table :product_status_masters do |t|
    	t.string :name
      t.timestamps
    end
  end
end
