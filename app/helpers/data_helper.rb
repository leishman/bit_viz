helpers do
  def flat_transaction(tx)
    output = {}
    transaction_hash = tx['transaction']
    output[:coinbase_id] = transaction_hash['id']
    output[:created_at] = transaction_hash['created_at']
    output[:hsh] = transaction_hash.fetch('hsh',"")
    output[:amount] = transaction_hash['amount']['amount']
    output[:recipient_address] = transaction_hash.fetch('recipient_address',"")
    output[:notes] = transaction_hash['notes']
    output
  end

  def flat_transfer(transfer)
    output = {}
    transfer_hash = transfer['transfer']
    output[:type] = transfer_hash['type']
    output[:fees_bank_cents] = transfer_hash['bank']['cents']
    output[:fees_coinbase_cents] = transfer_hash['coinbase']['cents']
    output[:btc_amount] = transfer_hash['btc']['amount']
    output[:total_amount] = transfer_hash['total']['amount']
    output[:description] = transfer_hash['description']
    output[:date] = transfer_hash['created_at']
    output[:payout_date] = transfer_hash['payout_date']
    output
  end
end