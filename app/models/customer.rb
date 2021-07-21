class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # falseならtrueを返すようにしている
  def active_for_authentication?
    super && (self.is_delete == false)
  end
  
end
