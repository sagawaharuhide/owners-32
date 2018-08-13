class ChangeColumnToOrder < ActiveRecord::Migration[5.1]
  def up
    change_column :orders, :quantity, :integer, null: false
  end

  def down
    change_column :orders, :quantity, :integer
  end
end
