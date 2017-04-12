json.extract! contato, :id, :nome, :apelido, :email, :telefone, :nascimento, :foto, :created_at, :updated_at
json.url contato_url(contato, format: :json)
