class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  # 小計の計算
  def sum_of_price
    item.add_tax_non_taxed_price * quantity
  end
  # 合計金額の計算
  def sum_total_price
    sum_of_price.all
  end
end
