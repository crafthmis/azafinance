class TransactionController < ApplicationController

  def index
    transactions = Transaction
				  .select('id,currency_from,currency_to,initial_amount,converted_amount,user_id')
	              .all()
                  .limit(50)

    render json: transactions
  end
  
  def show
    transaction = Transaction
	              .select('id,currency_from,currency_to,initial_amount,converted_amount,user_id')
	              .find params[:id]
    render json: transaction
  end
  
  def create
      
	  
	  @curr_from = transaction_params[:currency_from]
	  intFrom = Conversion.find(@curr_from)
	  if intFrom.nil then
	    render json "not found"
	  end
	  @curr_to = transaction_params[:currency_to]
	  @rate = Conversion
	            .select('conversion_rate')
				.where(currency_from: @curr_from,currency_to: @curr_to)
      transaction_params[:converted_amount] = "2009393"
	  puts @rate[0] 
	  @trx = Transaction.new(transaction_params)  
	  @trx.save
		render json: @trx
  end
  
  
  private
  def transaction_params
    params.require(:transaction).permit(:currency_from,:currency_to,:converted_amount,:initial_amount,:user_id)
  end
  
  def converted_amount
    self.converted_amount * 100
  end
  
end
