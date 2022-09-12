class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :venues, dependent: :destroy
  has_many :events, through: :venues
  has_many :events, through: :bookings
  has_many :bookings, dependent: :destroy
  validates :first_name, presence: true, length: { in: 2..20 }
  validates :last_name, presence: true, length: { in: 2..20 }
  validates :email, uniqueness: true, on: :create, format: { with: /\A.*@.*\.com\z/ }
  validates :age, presence: true
end
