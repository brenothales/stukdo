class Logs < ActiveRecord::Migration
  def change
  	create_table :logs do |t|
      t.references :subtask, index: true
      t.timestamp :start
      t.timestamp :stop
    end
  end
end
