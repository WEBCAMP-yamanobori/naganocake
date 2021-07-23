class Address < ApplicationRecord

  belongs_to :customer

  def address_info
    "〒" + self.postcode + " " + self.address + "　" + self.name
  end
end
