class Event < ApplicationRecord
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
end
