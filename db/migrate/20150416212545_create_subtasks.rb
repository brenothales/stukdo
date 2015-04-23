class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :name
      t.boolean :complete
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :subtasks, :tasks
  end
end
