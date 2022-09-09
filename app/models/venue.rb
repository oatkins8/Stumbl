class Venue < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
