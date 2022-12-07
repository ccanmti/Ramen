class CreateShopComments < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_comments do |t|
      t.text :comment,              null: false, default: ""
      t.integer :customer_id,              null: false, default: ""
      t.integer :shop_id,                  null: false, default: ""
      t.integer :product_id,               null: false, default: ""
      t.timestamps
    end
  end
end
