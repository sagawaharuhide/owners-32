class AddAvatarToPlan < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :avatar, :text
  end
end
