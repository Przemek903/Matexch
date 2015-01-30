class AddCostToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :cost, :float
  end
end
