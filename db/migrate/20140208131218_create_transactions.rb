class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :amount
      t.string :currency
      t.boolean :request
      t.string :hsh
      t.string :status
      t.string :recipient_email
      t.string :recipient_name
      t.string :recipient_address

      t.timestamps
    end
  end
end
