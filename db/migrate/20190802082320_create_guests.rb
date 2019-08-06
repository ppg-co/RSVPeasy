class CreateGuests < ActiveRecord::Migration[5.2]
  def up
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :response
      t.timestamps
    end
  end
  def down
    drop_table :guests
  end
end
