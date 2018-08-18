class ChangeColumnToAddress < ActiveRecord::Migration[5.1]
  def up
    change_column :addresses, :tel, :string, null: false

    change_column :addresses, :postal_code, :string, null: false
  end

  def down
    change_column :addresses, :tel, :integer, null: false

    change_column :addresses, :postal_code, :integer, null: false
  end
end
