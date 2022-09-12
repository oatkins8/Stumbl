class User < ApplicationRecord
  acts_as_favoritor
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :venues, dependent: :destroy
  has_many :events, through: :venues
  has_many :events, through: :bookings
  has_many :bookings, dependent: :destroy
end
