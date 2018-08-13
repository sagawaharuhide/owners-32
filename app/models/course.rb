class Course < ApplicationRecord
  belongs_to :plan
  has_many :orders
end
