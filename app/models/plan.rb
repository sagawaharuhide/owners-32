class Plan < ApplicationRecord

  has_many :courses
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def like_user(id)
    likes.find_by(user_id: id)
  end

  def display_deadline
    today = Date.today
    deadline = dead_line.to_date
    diff = (deadline - today).to_i
    return diff if diff < 30
  end
    # 今日の日付と募集締切までの日数の差分を返す関数

end

