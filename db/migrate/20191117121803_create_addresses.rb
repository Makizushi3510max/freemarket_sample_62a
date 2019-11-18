class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references  :user,              null: false, foreign_key: true
      t.string      :first_name,        null: false
      t.string      :last_name,         null: false
      t.string      :first_name_kana,	  null: false
      t.string      :last_name_kana,    null: false
      t.string      :postal_code,       null: false
      t.integer     :prefecture,        null: false
      t.string      :city_name,         null: false
      t.string      :block_number,      null: false
      t.string      :building_name
      t.string      :phone_number,      null: false
      t.timestamps
    end
  end
end
