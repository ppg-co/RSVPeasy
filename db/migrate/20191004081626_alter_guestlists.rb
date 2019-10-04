class AlterGuestlists < ActiveRecord::Migration[5.2]
  def change
    rename_column :guestlists, :name, :firstname
    add_column :guestlists, :lastname, :string, after: :firstname
  end
end
