class Venue < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # before_save :init

  # def init
  #   self.website  ||= ""
  #   self.facebook ||= ""
  #   self.instagram ||= ""
  #   self.about ||= ""
  # end

  # validates :name, presence: true, length: { in: 2..100 }
  # validates :location, presence: true
  # # validates :photos, presence: true
  # # validates :photo, presence: true
  # validates :about, presence: true, length: { in: 2..350 }
end
