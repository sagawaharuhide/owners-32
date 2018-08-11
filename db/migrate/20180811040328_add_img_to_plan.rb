class AddImgToPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :img_url, :text
  end
end
