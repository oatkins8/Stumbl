class Venue < ApplicationRecord
  # attr_default :location, "Shoreditch High Street, Hackney, London, E1 6JE, United Kingdom"
  before_validation :set_defaults

  belongs_to :user
  has_many :events, dependent: :destroy
  has_many_attached :photos
  has_one_attached :logo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # validates :name, presence: true, length: { in: 2..100 }
  validates :name, presence: true
  validates :location, presence: true
  validates :photos, presence: true
  validates :logo, presence: true
  # validates :about, presence: true, length: { in: 2..350 }

  private

  def set_defaults
    self.location = "62 St Giles' St, Northampton NN1 1JW" if self.location.blank?
  end
end
