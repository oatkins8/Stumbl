class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  monetize :amount_cents
  validates :quantity, presence: true
end
