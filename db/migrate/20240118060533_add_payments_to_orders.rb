class AddPaymentsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :routing_number, :string, default: nil
    add_column :orders, :account_number, :string, default: nil
    add_column :orders, :credit_card_number, :string, default: nil
    add_column :orders, :expiration_date, :string, default: nil
    add_column :orders, :po_number, :string, default: nil
  end
end
