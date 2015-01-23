class ChangeCurrentExchangeTypeInProducts < ActiveRecord::Migration
  def change
  	change_column :products, :currentExchange, :float
  end
end
