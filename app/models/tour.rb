class Tour < ApplicationRecord
  has_many :orders, through: :tour_orders
  has_many :tour_orders
  has_many :comments
  belongs_to :user
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  has_attached_file :photo, styles: { medium: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  #tour filters
  scope :a_z, -> {order(title: :asc)}
  scope :z_a, -> {order(title: :desc)}
  scope :most_recent, -> {order(created_at: :desc)}
  scope :oldest, -> {order(created_at: :asc)}
  
end
