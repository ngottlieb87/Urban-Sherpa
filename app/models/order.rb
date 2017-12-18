class Order < ApplicationRecord
  belongs_to :Account
  has_many :tours, through: :tour_orders

  before_save :update_total
  before_create :update_status

  def calculate_total
    self.tour_orders.collect {|item| item.tour.price * tour.quantity }.sum
  end

  private

  def update_status
    if self.update == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end

end
