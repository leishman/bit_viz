class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.string :type
      t.string :code
      t.integer :fees_coinbase_cents
      t.string :fees_coinbase_currency
      t.integer :fees_bank_cents
      t.string :fees_bank_currency
      t.string  :status
      t.string :btc_amount
      t.string :subtotal_amount
      t.string :subtotal_currency
      t.string :total_amount
      t.string :total_currency
      t.string  :description
      t.string :transaction_id


      t.timestamps
    end
  end
end
