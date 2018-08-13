class Order < ApplicationRecord

  belongs_to :course
  delegate :user, to: :address
  belongs_to :address

end
