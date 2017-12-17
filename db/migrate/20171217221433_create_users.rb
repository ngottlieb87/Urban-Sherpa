class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :user_name, :string
      t.column :admin, :boolean, default: false
      t.column :guide, :boolean, default: false
      t.column :password_hash, :string
      t.column :password_salt, :string
    end
  end
end
