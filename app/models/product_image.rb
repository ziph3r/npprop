class ProductImage < ActiveRecord::Base
	belongs_to :product
	has_attached_file :image,
    :styles => {
      :thumb=> "100x100>",
      :small  => "300x300>",
      :large => "600x600>"
        }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
end
