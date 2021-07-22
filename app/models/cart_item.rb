class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # 小計の計算
  def sum_of_price
    item.add_tax_non_taxed_price * quantity
  end
  
end
