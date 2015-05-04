class AddPublicToTask < ActiveRecord::Migration
  def change
  	add_column :users, :tasks_count, :integer, default: 0
    add_column :tasks, :public, :boolean, default: false
  end
end
