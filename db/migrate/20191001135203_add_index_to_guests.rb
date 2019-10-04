class AddIndexToGuests < ActiveRecord::Migration[5.2]
  def change
    add_index :guests, :event_id
  end
end
