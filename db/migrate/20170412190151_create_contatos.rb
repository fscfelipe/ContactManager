class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :nome
      t.string :apelido
      t.string :email
      t.string :telefone
      t.string :nascimento
      t.string :foto

      t.timestamps null: false
    end
  end
end
