class Image < ApplicationRecord
	belongs_to :post

	has_attached_file :img, :default_url => "/images/normal/missing.png", styles: {xlarge: "900x900>", large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  	do_not_validate_attachment_file_type :img
end
