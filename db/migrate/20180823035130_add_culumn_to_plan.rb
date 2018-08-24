class AddCulumnToPlan < ActiveRecord::Migration[5.1]
  def change
    add_reference :plans, :category, foreign_key: true
  end
end
