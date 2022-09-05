class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :venue
      t.date :date
      t.time :time
      t.integer :price
      t.string :genre
      t.string :category
      t.string :producer
      t.string :name
      t.string :image
      t.text :about
      t.string :mini_description
      t.integer :tickets_available
      t.boolean :cash
      t.boolean :card
      t.integer :min_age
      t.timestamps
    end
  end
end
