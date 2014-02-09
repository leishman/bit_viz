class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to  :user
      t.string      :coinbase_id, :unique => true
      t.datetime    :date_time
      t.string      :hsh
      t.integer     :amount, :limit => 8
      t.string      :recipient_address
      t.string      :notes

      t.timestamps
    end
  end
end
