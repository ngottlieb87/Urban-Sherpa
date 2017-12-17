class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :date
      t.time :time
      t.decimal :price

     t.timestamps
    end
  end
end
