class Event < ApplicationRecord
  has_one :user
  has_many :guestlists
  has_many :guests
  accepts_nested_attributes_for :guestlists
  #has_one :location
  has_one_attached :cover_photo
  scope :sorted, lambda {order("created_at DESC")}

  validates :name, :location, :date_of_event, :rsvp_cut_off, presence: true
end
