class Tour < ApplicationRecord
  has_many :orders, through: :tour_orders
  has_many :tour_orders
  has_many :comments
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
end
