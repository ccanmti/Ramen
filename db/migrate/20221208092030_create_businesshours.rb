class CreateBusinesshours < ActiveRecord::Migration[6.1]
  def change
    create_table :businesshours do |t|
      t.time :start_time
      t.time :end_time
      t.boolean :monday, default: "FALSE"
      t.boolean :tuesday, default: "FALSE"
      t.boolean :wednesday, default: "FALSE"
      t.boolean :thursday, default: "FALSE"
      t.boolean :friday, default: "FALSE"
      t.boolean :saturday, default: "FALSE"
      t.boolean :sunday, default: "FALSE"
      t.integer :shop_id

      t.timestamps
    end
  end
end
