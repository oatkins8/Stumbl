class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.string :name
      t.string :photos
      t.string :venue
      t.text :about
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :photo

      t.timestamps
    end
  end
end
