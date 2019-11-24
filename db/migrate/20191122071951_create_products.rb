class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string      :name,              null: false
      t.text        :description,       null: false
      t.references  :seller,            null: false, foreign_key: { to_table: :users }
      t.references  :buyer,             foreign_key: { to_table: :users }
      t.references  :category,          null: false, foreign_key: true
      t.references  :brand,             foreign_key: true
      t.references  :size,              null: false, foreign_key: true
      t.integer     :condition,         null: false
      t.integer     :shipping_cost,     null: false
      t.integer     :shipping_area,     null: false
      t.integer     :shipping_date,     null: false
      t.references  :shipping_address,  foreign_key: { to_table: :addresses }
      t.integer     :price,             null: false

      t.timestamps
    end
  end
end
