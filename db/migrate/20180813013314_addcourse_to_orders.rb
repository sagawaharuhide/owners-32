class AddcourseToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :course, foreign_key: true
  end
end
