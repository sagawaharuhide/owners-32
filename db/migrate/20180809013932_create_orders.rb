class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :address, null: false, foreign_key: true
      t.timestamps
    end
  end
end
