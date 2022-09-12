class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :venues, dependent: :destroy
  has_many :events, through: :venues
  has_many :events, through: :bookings
  has_many :bookings, dependent: :destroy
  acts_as_favoritor
end
