class AccountTransactionsController < ApplicationController
  def new
    @account_transaction = AccountTransaction.new
  end

  def create
    @account_transaction = AccountTransaction.new params.require(:account_transaction).permit(:account_id, :amount)
    if @account_transaction.save
      redirect_to root_path
    else
      render :new
    end
  end
end
