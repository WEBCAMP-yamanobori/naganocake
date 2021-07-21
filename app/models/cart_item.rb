class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def sum_of_price
    item.add_tax_non_taxed_price * quantity
  end
end
