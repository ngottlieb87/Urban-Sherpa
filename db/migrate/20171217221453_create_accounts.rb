class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
       t.column :user_id, :integer
    end
  end
end
