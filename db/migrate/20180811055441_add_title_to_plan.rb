class AddTitleToPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :title, :text
  end
end
