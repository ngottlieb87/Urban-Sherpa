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
  scope :most_reviewed, -> { Tour.select("tours.title, tours.description, tours.price, tours.date,tours.photo_file_name, tours.photo_content_type, tours.photo_file_size, tours.id, count(comments.id) as reviews_count")
                            .joins(:comments)
                            .group("tours.id")
                            .order("reviews_count desc")}
end
