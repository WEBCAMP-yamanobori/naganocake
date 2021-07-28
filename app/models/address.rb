class Address < ApplicationRecord

  belongs_to :customer
  
  validates :name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true

  def address_info
    "〒" + self.postcode + " " + self.address + "　" + self.name
  end
end
