class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string     :name, null: false
      t.integer    :price, null: false
      t.references :plan, null: false, foreign_key: true
      t.timestamps
    end
  end
end
