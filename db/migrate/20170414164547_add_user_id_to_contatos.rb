class AddUserIdToContatos < ActiveRecord::Migration
  def change
  	add_column :contatos, :user_id, :integer
  	add_index :contatos, :user_id
  end
end
