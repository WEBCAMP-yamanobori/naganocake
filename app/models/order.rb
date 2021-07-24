class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items

  def sum_of_price
    item.add_tax_non_taxed_price * quantity
  end

end