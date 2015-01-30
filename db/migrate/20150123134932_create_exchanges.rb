class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :product_id
      t.float :value

      t.timestamps null: false
    end
  end
end
