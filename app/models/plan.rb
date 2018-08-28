class Plan < ApplicationRecord

  has_many :courses
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def display_deadline
    today = Date.today
    deadline = dead_line.to_date
    diff = (deadline - today).to_i
    if diff.between?(0,30)
      return diff
    end
  end

end

