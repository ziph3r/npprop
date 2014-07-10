class Image < ActiveRecord::Base
	validates :name, presence:true
	has_attached_file :file,
    :styles => {
      :thumb=> "100x100>",
      :small  => "300x300>",
      :large => "600x600>"
        }
	validates_attachment :file, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
