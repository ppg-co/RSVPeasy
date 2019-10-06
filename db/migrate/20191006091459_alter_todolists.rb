class AlterTodolists < ActiveRecord::Migration[5.2]
  def change
    add_column :todo_lists, :event_id, :intger
    add_index :todo_lists, [:event_id]
  end
end
