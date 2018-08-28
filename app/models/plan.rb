class Plan < ApplicationRecord

  has_many :courses
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def display_deadline
    today = Date.today
    deadline = dead_line.to_date
    diff = (deadline - today).to_i
    return diff if diff < 30
  end

end

