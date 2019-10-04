class AlterUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :firstname
    add_column :users, :lastname, :string, after: :firstname
  end
end
