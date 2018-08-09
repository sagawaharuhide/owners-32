class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end