class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :shop_id,               null: false
      t.integer :genre_id,              null: false
      t.string :name,                   null: false, default: ""
      t.text :introduction,             null: false, default: ""
      t.integer :price,                 null: false
      t.timestamps
    end
  end
end
