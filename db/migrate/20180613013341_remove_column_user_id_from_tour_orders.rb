class RemoveColumnUserIdFromTourOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :tour_orders, :user_id, :integer
  end
end
