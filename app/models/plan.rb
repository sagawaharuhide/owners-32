class Plan < ApplicationRecord

  has_many :courses
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
end
