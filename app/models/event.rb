class Event < ApplicationRecord
  acts_as_favoritable
  has_many :bookings, dependent: :destroy
  belongs_to :venue
  include PgSearch::Model
  has_many_attached :images
  monetize :price_cents
  pg_search_scope :global_search,
                  against: [ :name, :category, :genre, :producer ],
                  associated_against: {
                    venue: [ :name, :location]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
  validates :name, presence: true, length: { in: 2..25 }
  validates :date, presence: true
  validates :time, presence: true
  validates :category, presence: true
  # validates :image, presence: true
  validates :about, presence: true, length: { in: 50..350 }
  validates :mini_description, presence: true, length: { in: 10..30 }
  validates :cash, presence: true
  validates :card, presence: true
end
