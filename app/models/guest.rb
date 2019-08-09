class Guest < ApplicationRecord
  belongs_to :event

  def self.search_by(search_term)
    where("(id) LIKE :search_term", search_term: "%#{search_term}%")
  end
end
