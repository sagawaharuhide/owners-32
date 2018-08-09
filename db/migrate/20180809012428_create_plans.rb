class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :producer, null: false
      t.string :area, null: false
      t.string :area, null: false
      t.date   :dead_line, null: false
      t.timestamps
    end
  end
end
