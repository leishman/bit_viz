class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.belongs_to  :user
      t.string      :coinbase_id, :unique => true
      t.string      :order_type
      t.integer     :fees_bank_cents
      t.integer     :fees_coinbase_cents
      t.integer     :btc_amount, :limit => 8
      t.integer     :total_amount, :limit => 8
      t.string      :description
      t.datetime    :date_time
      t.string      :payout_date

      t.timestamps
    end
  end
end
