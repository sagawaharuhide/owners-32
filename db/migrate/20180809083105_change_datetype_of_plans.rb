class ChangeDatetypeOfPlans < ActiveRecord::Migration[5.1]
  def change
    change_column :plans, :dead_line, :string
  end
end
