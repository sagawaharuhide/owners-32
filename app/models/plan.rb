class Plan < ApplicationRecord

  has_many :courses
  belongs_to :category

end
