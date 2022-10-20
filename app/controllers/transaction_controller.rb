class TransactionController < ApplicationController

  def index
    transactions = Transaction
				  .select('id,currency_from,currency_to,converted_amount,user_id')
	              .all()
                  .limit(50)

    render json: transactions
  end
  
  def show
    transaction = Transaction
	              .select('id,currency_from,currency_to,converted_amount,user_id')
	              .find params[:id]
    render json: transaction
  end
  
  def create
	  @trx = Transaction.new(transaction_params)  
	  @curr_from = transaction_params[:currency_from]
	  @curr_to = transaction_params[:currency_to]
	  @amount = Conversion
	            .select('conversion_rate')
				.where(currency_from: @curr_from,currency_to: @curr_to)
      @trx[:initial_amount] = @amount 
	  @trx.save
		render json: @trx
  end
  
  
  private
  def transaction_params
    params.require(:transaction).permit(:currency_from,:currency_to,:converted_amount,:initial_amount,:user_id)
  end
  
end
