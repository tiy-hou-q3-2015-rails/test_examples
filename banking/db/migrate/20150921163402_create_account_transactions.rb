class CreateAccountTransactions < ActiveRecord::Migration
  def change
    create_table :account_transactions do |t|
      t.integer :account_id
      t.decimal :amount
      t.string :name

      t.timestamps null: false
    end
  end
end
