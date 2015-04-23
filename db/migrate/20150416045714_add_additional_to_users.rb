class AddAdditionalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: ""
    add_column :users, :nome, :string, null: false, default: ""
    add_column :users, :sobrenome, :string
    add_column :users, :apelido, :string
    add_column :users, :bio, :text
    add_column :users, :celular, :string
    add_column :users, :funcacao, :string
    add_column :users, :formacao, :string
    add_column :users, :datanascimento, :date
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :whatsapp, :string
    add_column :users, :setor, :string
    add_column :users, :ramal, :string

  end

end
