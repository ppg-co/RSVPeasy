class AddStateToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :state, :string, after: :rsvp_cut_off
  end
end
