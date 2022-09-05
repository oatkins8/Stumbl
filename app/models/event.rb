class Event < ApplicationRecord
  has_many :bookings
  belongs_to :venue
end
