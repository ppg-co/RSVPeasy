class AlterGueslistsIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :guestlists, [:event_id]
    add_index :guestlists, [:event_id, :id], unique: true 
  end
end
