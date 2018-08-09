class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string  :full_name, null: false
      t.integer :postal_code, null:false
      t.string  :prefecture, null:false
      t.string  :city, null:false
      t.string  :house_number, null:false
      t.integer :tel, null:false
      t.references  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
