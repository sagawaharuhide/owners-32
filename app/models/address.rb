class Address < ApplicationRecord
  validates :full_name, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :tel, presence: true
  
  belongs_to :user
  has_many :orders

end
