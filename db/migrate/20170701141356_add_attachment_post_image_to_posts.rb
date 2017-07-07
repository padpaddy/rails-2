class AddAttachmentPostImageToPosts < ActiveRecord::Migration[4.2]

  def self.up
    add_attachment :posts, :post_image
  end

  def self.down
    remove_attachment :posts, :post_image
  end
end
