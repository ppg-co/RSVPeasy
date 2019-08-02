class AlterGuest < ActiveRecord::Migration[5.2]
  def change
    add_column('guests', 'name', :string)
    add_column('guests', 'email', :string)
    add_column('guests', 'response', :string)
    add_column('guests', 'event_id', :integer)
  end
end
