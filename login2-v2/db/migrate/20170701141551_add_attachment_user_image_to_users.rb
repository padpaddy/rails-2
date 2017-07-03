class AddAttachmentUserImageToUsers < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :users, :user_image
  end

  def self.down
    remove_attachment :users, :user_image
  end
end
