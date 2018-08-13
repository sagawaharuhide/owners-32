class AddDetailToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :detail, :text
  end
end
