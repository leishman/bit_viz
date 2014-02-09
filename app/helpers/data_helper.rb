helpers do
  def create_tx(tx)
    output = {}
    transaction_hash = tx['transaction']
    output[:coinbase_id] = transaction_hash['id']
    output[:date_time] = DateTime.strptime(transaction_hash['created_at'], '%FT%T%:z')
    output[:hsh] = transaction_hash.fetch('hsh',"")
    output[:amount] = (transaction_hash['amount']['amount'].to_f * 100_000_000).to_i
    output[:recipient_address] = transaction_hash.fetch('recipient_address',"")
    output[:notes] = transaction_hash['notes']
    output
  end

  def create_tf(transfer)
    output = {}
    transfer_hash = transfer['transfer']
    output[:coinbase_id] = transfer_hash['transaction_id']
    output[:type] = transfer_hash['type']
    output[:fees_bank_cents] = transfer_hash['bank']['cents']
    output[:fees_coinbase_cents] = transfer_hash['coinbase']['cents']
    output[:btc_amount] = (transfer_hash['btc']['amount'].to_f * 100_000_000).to_i
    output[:total_amount] = (transfer_hash['total']['amount'].to_f * 100).to_i
    output[:description] = transfer_hash['description']
    output[:date_time] =  DateTime.strptime(transfer_hash['created_at'], '%FT%T%:z')
    output[:payout_date] = DateTime.strptime(transfer_hash['payout_date'], '%FT%T%:z')
    output
  end
end