class AccountTransaction < ActiveRecord::Base
  belongs_to :account

  validates :account, presence: true
  validates :amount, presence: true
end
