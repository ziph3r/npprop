class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
    	t.string :image_file_name
    	t.string :image_content_type
    	t.integer :image_file_size
    	t.references :product
      t.timestamps
    end
  end
end
