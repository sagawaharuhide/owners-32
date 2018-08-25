class Plan < ApplicationRecord

  has_many :courses
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
end
