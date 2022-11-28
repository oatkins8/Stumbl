class Event < ApplicationRecord
  include Filterable
  scope :category, ->(category) { where(category: category) }
  scope :genre, ->(genre) { where(genre: genre) }
  # scope :price, ->(price) { where(price: price) }



  def price_range
    price = price_cents / 100
    case price
    when nil
      "Error"
    when 0
      "Free"
    when 1..9.99
      "Under £10"
    when 10.00..19.99
      "Under £20"
    else
      "£20 or Over"
    end
  end


  acts_as_favoritable
  has_many :bookings, dependent: :destroy
  belongs_to :venue
  has_many_attached :images
  monetize :price_cents
  # include PgSearch::Model
  # pg_search_scope :global_search,
  #                 against: [ :name, :category, :genre, :producer ],
  #                 associated_against: {
  #                   venue: [ :name, :location]
  #                 },
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }

  # validates :name, presence: true, length: { in: 2..100 }
  # validates :date, presence: true
  validates :time, presence: true
  # validates :category, presence: true
  validates :images, presence: true
  # # validates :about, presence: true, length: { in: 2..350 }
  # validates :mini_description, presence: true, length: { in: 10..30 }
  # validates :cash, presence: true
  # validates :card, presence: true
end
