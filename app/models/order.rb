class Order < ApplicationRecord
  enum pay_type: { 
    "Check" => 0, 
    "Credit card" => 1, 
    "Purchase order" => 2 
  }
  has_many :line_items, dependent: :destroy
#...
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  

  if pay_types[:pay_type] == 0
    validates :account_number, :routing_number, presence: true
  elsif pay_types[:pay_type] == 1
    validates :credit_card_number, :expiration_date, presence: true
  elsif pay_types[:pay_type] == 2
    validates :po_number, presence: true
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
