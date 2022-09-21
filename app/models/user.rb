class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :venues, dependent: :destroy
  has_many :events, through: :venues
  has_many :events, through: :bookings
  has_many :bookings, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, on: :create, format: { with: /\A.*@.*\.com\z/ }
  acts_as_favoritor
end
