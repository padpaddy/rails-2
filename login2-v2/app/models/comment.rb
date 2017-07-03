class Comment < ApplicationRecord
	validates :content, presence: true
	belongs_to :post
	belongs_to :user
	has_attached_file :comment_image, :default_url => "/images/normal/missing.png", styles: {xlarge: "900x900>", large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :comment_image, content_type: /\Aimage\/.*\z/
end
