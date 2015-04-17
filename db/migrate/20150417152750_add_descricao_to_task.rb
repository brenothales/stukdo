class AddDescricaoToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :descricao, :text
    add_column :tasks, :url, :string
  end
end
