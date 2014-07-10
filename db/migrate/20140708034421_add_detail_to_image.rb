class AddDetailToImage < ActiveRecord::Migration
  def change
  		add_column :images, :file_file_name, :string
    	add_column :images, :file_content_type, :string
    	add_column :images,  :file_file_size, :integer
  end
end
