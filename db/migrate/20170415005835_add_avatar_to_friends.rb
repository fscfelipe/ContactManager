class AddAvatarToFriends < ActiveRecord::Migration
  def self.up
    add_attachment :contatos, :avatar
  end

  def self.down
    remove_attachment :contatos, :avatar
  end
end
