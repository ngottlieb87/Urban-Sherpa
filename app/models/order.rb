class Order < ApplicationRecord
  belongs_to :account
  has_many :tours, through: :tour_orders
  has_many :tour_orders
  before_save :update_total
  before_create :update_status

  def calculate_total
    self.tour_orders.collect {|item| item.tour.price * item.quantity }.sum
  end

  private

  def update_status
    if self.status == nil
        self.status = "In Progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end
end
