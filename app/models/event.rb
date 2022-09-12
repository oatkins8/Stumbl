class Event < ApplicationRecord

  def price_range
    case price
    when nil
      "Error"
    when 0
      "Free"
    when 0.01..9.99
      "Under £10"
    when 10..19.99
      "Under £20"
    else
      "Over £20"
    end
  end

  has_many :bookings, dependent: :destroy
  belongs_to :venue
  include PgSearch::Model
  has_many_attached :images
  pg_search_scope :global_search,
                  against: [ :name, :category, :genre, :producer ],
                  associated_against: {
                    venue: [ :name, :location]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

end
