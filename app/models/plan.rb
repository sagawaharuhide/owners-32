class Plan < ApplicationRecord

  has_many :courses
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def like_user(id)
    likes.find_by(user_id: id)
  end
end
