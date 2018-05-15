class TourOrder < ApplicationRecord
  belongs_to :tour
  belongs_to :order
  validates :quantity, presence: true
end
