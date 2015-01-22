class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.string :street
      t.string :city
      t.integer :homeNumber
      t.integer :streetNumber
      t.date :dateOfBirth
      t.integer :user_id
      t.integer :balance

      t.timestamps null: false
    end
  end
end
