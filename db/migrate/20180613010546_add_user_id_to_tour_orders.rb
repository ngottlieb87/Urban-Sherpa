class AddUserIdToTourOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :tour_orders, :user_id, :integer
  end
end
