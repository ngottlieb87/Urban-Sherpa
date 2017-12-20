class Tour < ApplicationRecord
  has_many :orders, through: :tour_orders
  has_many :tour_orders
  has_many :comments
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  has_attached_file :photo, styles: { medium: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
