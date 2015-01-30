class ProductController < ApplicationController

	def show
		@product = Product.find_by_id(params[:id])
		@transaction = Transaction.new
		@exchange = []
  		sumExchange = 0

  		@product.exchanges.last(10).each do |prod|
 		   @exchange << [prod.created_at, prod.value.round(2)]
 		   sumExchange = sumExchange + prod.value.round(2)
 	  	end
    
 	  	@plusRange = (sumExchange/10) + 20
 	  	@minusRange	 = (sumExchange/10) - 20

	end
end
