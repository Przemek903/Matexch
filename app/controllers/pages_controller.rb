class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  	@products = Product.all
    @transaction = Transaction.new
    @transactions = Transaction.last(5)
    gold = Product.first
    @exchange = []
  	sumExchange = 0
  	
    gold.exchanges.last(10).each do |prod|
 		   @exchange << [prod.created_at, prod.value.round(2)]
 		   sumExchange = sumExchange + prod.value.round(2)
 	  end
    
 	  @plusRange = (sumExchange/10) + 20
 	  @minusRange	 = (sumExchange/10) - 20
  end
  
  def inside
  end

end
