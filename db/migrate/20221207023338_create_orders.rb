class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,              null: false
      t.string :postal_code,              null: false, default: ""
      t.string :address,                  null: false, default: ""
      t.string :name,                     null: false, default: ""
      t.integer :shipping_cost,           null: false
      t.integer :total_payment,           null: false
      t.integer :payment_method,          null: false, default: 0
      t.integer :status,                  null: false, default: 0
      t.timestamps
    end
  end
end
