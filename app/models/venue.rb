class Venue < ApplicationRecord
  belongs_to :user
  has_many :events

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
