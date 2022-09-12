class RemovePriceFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :price
  end
end
