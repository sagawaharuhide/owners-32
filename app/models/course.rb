class Course < ApplicationRecord
  belongs_to :plan
  has_many :order_details
  has_many :orders, through: :order_details
end
