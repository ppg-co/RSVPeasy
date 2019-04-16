class Event < ApplicationRecord
  has_one :user
  has_and_belongs_to_many :guests
  scope :sorted, lambda {order("created_at DESC")}
end
