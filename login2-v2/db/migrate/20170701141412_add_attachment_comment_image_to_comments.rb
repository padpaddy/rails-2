class AddAttachmentCommentImageToComments < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :comments, :comment_image
  end

  def self.down
    remove_attachment :comments, :comment_image
  end
end
