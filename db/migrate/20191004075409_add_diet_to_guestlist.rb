class AddDietToGuestlist < ActiveRecord::Migration[5.2]
  def change
    add_column :guestlists, :dietary_requirements, :string, after: :response
  end
end
