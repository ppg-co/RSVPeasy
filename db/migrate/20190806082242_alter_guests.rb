class AlterGuests < ActiveRecord::Migration[5.2]
  def change
    add_column('guests', 'event_id', :integer)
  end
end
