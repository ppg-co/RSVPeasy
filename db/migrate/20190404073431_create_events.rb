class CreateEvents < ActiveRecord::Migration[5.2]
  def up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
