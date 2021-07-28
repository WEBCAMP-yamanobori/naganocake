class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  attachment :image

  def add_tax_non_taxed_price
    (self.non_taxed_price * 1.10).round
  end

   validates :name, presence: true
   validates :introduction, presence: true
   validates :non_taxed_price, presence: true
  # validates :genre_id, presence: true

end
