class Event < ApplicationRecord
  has_many :bookings
  belongs_to :venue
  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [ :name, :category, :genre, :producer ],
                  associated_against: {
                    venue: [ :name, :location]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
