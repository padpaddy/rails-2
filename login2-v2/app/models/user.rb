class User < ApplicationRecord
	validates_presence_of :first_name, :last_name
	validates_uniqueness_of :email
	validates :email, :email_format => { :message => 'is not looking good' }
	validates :password, length: { minimum: 6 }

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_attached_file :user_image, :default_url => "/images/normal/missing.png", styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :user_image, content_type: /\Aimage\/.*\z/
end
