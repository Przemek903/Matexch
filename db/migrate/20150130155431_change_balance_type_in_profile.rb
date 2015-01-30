class ChangeBalanceTypeInProfile < ActiveRecord::Migration
  def change
  	change_column :profiles, :balance, :float
  end
end
