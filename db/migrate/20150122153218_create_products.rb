class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :classification_id
      t.integer :currentExchange
      t.string :slug

      t.timestamps null: false
    end
  end
end
