class Event < ApplicationRecord
  has_one :user
  has_many :guestlists
  accepts_nested_attributes_for :guestlists
  #has_one :location
  has_one_attached :cover_photo
  has_many :guestlists
  has_many :guests
  scope :sorted, lambda {order("created_at DESC")}
end
