class ProductImage < ActiveRecord::Base
	belongs_to :product
	has_attached_file :image,
    :styles => {
      :thumb=> "143x83#",
      :small  => "265x163#",
      :large => "848x467#"
        }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
end
