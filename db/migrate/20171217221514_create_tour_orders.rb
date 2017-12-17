class CreateTourOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_orders do |t|
      t.integer :tour_id
      t.integer :order_id
    end
  end
end
