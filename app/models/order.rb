class Order < ApplicationRecord

  has_many :order_details
  has_many :courses, through: :order_details
  delegate :user, to: :address
  belongs_to :address

end
