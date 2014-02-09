require 'faker'
require 'securerandom'
require 'pp'

def time_rand(from = 1_300_000_000.0, to = Time.now)
  Time.at(from + rand * (to.to_f - from.to_f))
end

external = []

# External Transaction
50.times do
  external << {coinbase_id: SecureRandom.hex,
             created_at: time_rand,
             hsh: SecureRandom.hex,
             amount: rand(1...1_000),
             recipient_address: SecureRandom.hex,
             notes: Faker::Lorem.words(10).join(' '),}
end

external.each do |t|
  pp t
  puts ""
end

transfer = []
# Transfer
50.times do
  random_bool = [true,false].sample
  amount = rand(1...1_000)
  time = time_rand
  transfer << {type: (random_bool ? "Buy" : "Sell"),
               fees_bank_cents:amount*73000*5/1000,
               fees_coinbase_cents:amount*73000*5/1000,
               btc_amount: amount,
               total_amount:amount*73000,
               description:"Paid for with $#{amount*73000/100.to_f.round(2)} from Test xxxxx3111.",
               date:time,
               payout_date: time + (rand(1..5)*rand(1..5)*rand(1..5)*rand(1..5)*60),
  }
end

# transfer.each do |t|
#   pp t
#   puts ""
# end
#   def flat_transfer(transfer)
#     output = {}
#     transfer_hash = transfer['transfer']
#     output[:type] = transfer_hash['type']
#     output[:fees_bank_cents] = transfer_hash['bank']['cents']
#     output[:fees_coinbase_cents] = transfer_hash['coinbase']['cents']
#     output[:btc_amount] = transfer_hash['btc']['amount']
#     output[:total_amount] = transfer_hash['total']['amount']
#     output[:description] = transfer_hash['description']
#     output[:date] = transfer_hash['created_at']
#     output[:payout_date] = transfer_hash['payout_date']
#     output
#   end
# end