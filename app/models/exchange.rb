class Exchange < ActiveRecord::Base
	belongs_to :product

	validates :product_id, :value, presence: true


	def self.create_exchange
		products = Product.all
		
		products.each do |prod|
			newCurrentExchange = prod.currentExchange + rand(-1.0..1.0) * 0.05 * prod.currentExchange
			Exchange.where(:product_id => prod.id, :value => newCurrentExchange).first_or_create!
			prod.currentExchange = newCurrentExchange
			prod.save!
		end 
	end

end
