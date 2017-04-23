class AddDateTimeContactBirthday < ActiveRecord::Migration
  def change
  	remove_column :contatos, :nascimento, :string
  	add_column :contatos, :nascimento, :date
  end
end
