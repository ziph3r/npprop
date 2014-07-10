class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :title
    	t.text :content
    	t.float :sell_price
    	t.float :land_price
    	t.float :sqr_area
    	t.float :width
    	t.float :depth
    	t.float :rent_price
    	t.boolean :is_show
    	t.references :product_status_master
    	t.references :contact
      t.timestamps
    end
  end
end
