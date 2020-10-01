class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.integer :pay_id,           null: false, foreign_key: true
      t.integer :area_id,             null: false
      t.string :postal_code,       null: false
      t.string :city,              null: false
      t.string :house_number,      null: false
      t.string :building_number
      t.string :telephone_number,   null: false
      t.timestamps
    end
  end
end
