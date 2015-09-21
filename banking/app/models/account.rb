class Account < ActiveRecord::Base
  has_many :account_transactions

  def balance
    # account_transactions.map{|at| at.amount}.sum
    account_transactions.pluck(:amount).sum
  end
end
