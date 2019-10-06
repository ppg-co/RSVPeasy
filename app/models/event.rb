class Event < ApplicationRecord
  # belongs_to :user
  has_many :guestlists , :dependent => :destroy
  accepts_nested_attributes_for :guestlists

  has_many :todo_lists, :dependent => :destroy
  has_many :todo_items, :through => :todo_lists
  accepts_nested_attributes_for :todo_lists
  accepts_nested_attributes_for :todo_items

  has_one_attached :cover_photo
  scope :sorted, lambda {order("created_at DESC")}

   validates :name, :location, :date_of_event, :rsvp_cut_off, presence: true
   validate :event_date_is_valid
   validate :cut_off_before_event

#Custom Validations to ensure dates selected do not conflict with eachother
  def event_date_is_valid
    if date_of_event < DateTime.now
      errors.add(:date_of_event, ": Uuum! Unfortunately you cannot create an event in the past.. This isn't back to the future. Please select a date that is still to come.")
    end
  end

  def cut_off_before_event
    if  date_of_event < rsvp_cut_off
      errors.add(:rsvp_cut_off, ": Wrong option")
    end
  end
end
