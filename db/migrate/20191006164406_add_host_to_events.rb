class AddHostToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :hostname, :string, after: :name
  end
end
