require 'faker'
require 'securerandom'
require 'pp'

def time_rand
  DateTime.new(2013,rand(1..12),rand(1..28))
end

@user = User.create({email: 'leishman3@outlook.com'})
# External Transaction
50.times do
  tx = { coinbase_id: SecureRandom.hex,
         date_time: time_rand,
         hsh: SecureRandom.hex,
         amount: rand(-600...1_000) * 10_000_000,
         recipient_address: [SecureRandom.hex, ""].sample,
         notes: Faker::Lorem.words(10).join(' ')}

  @user.transactions << Transaction.create(tx)

end

# Transfers

50.times do
  amount = rand(1...20) / 10 # in BTC
  trans = {coinbase_id: SecureRandom.hex,
         order_type: "Buy",
         fees_bank_cents: 15,
         fees_coinbase_cents: amount * 700,
         btc_amount: (amount * 100_000_000).to_i,
         total_amount: amount * rand(30..1000),
         description: Faker::Lorem.words(10).join(' '),
         date_time: time_rand,
         payout_date: time_rand
  }

  @user.transfers << Transfer.create(trans)
end
