class AddPaymentColumnToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :state, :string
    add_column :bookings, :amount_cents, :integer, default: 0
    add_column :bookings, :checkout_session_id, :string
  end
end
