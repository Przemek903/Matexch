class TransactionController < ApplicationController
  before_action :set_transaction, only: [:show, :destroy]
  before_filter :authenticate_user!

  def new
  	@transaction = Transaction.new
  end

  def create
  	@transaction = Transaction.new(transaction_params)
  	@transaction.cost = Product.find_by_id(transaction_params[:product_id]).exchanges.last.value.round(2)
  	respond_to do |format|
  		if @transaction.save
  			current_user.profile.balance = current_user.profile.balance - (@transaction.quantity * @transaction.cost)
  			current_user.profile.save
  			format.html { redirect_to root_path, notice: 'Dokonałeś transakcji'}
  		else
  			format.html { render root_path }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
  	end  	
  end

  def show
  end

  def index
  	@transactions = current_user.transactions
  end

  def destroy
  	@transaction.destroy

  	redirect_to root_path
  end

  private	  
 
	  def set_transaction
	  	@transaction = Transaction.find(params[:id])
	  end

	  def transaction_params
	  	params.require(:transaction).permit(:product_id, :user_id, :quantity, :cost)
	  end
end
