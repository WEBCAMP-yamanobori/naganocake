class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  # has_many:order_items, dependent: :destroy
  attachment :image

  def add_tax_non_taxed_price
    (self.non_taxed_price * 1.10).round
  end
end
