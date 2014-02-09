require 'debugger'

get '/' do
  @coinbase_url="https://coinbase.com/oauth/authorize?response_type=code&client_id=#{ENV['CLIENT_ID']}&redirect_uri=#{ENV['CALLBACK_URL']}&scope=transactions+transfers+balance"
  erb :index
end

get '/oauth-callback' do

  # Get access token
  @token = get_access_token

  @transactions = get_transactions
  @transfers = get_transfers
  @balance = get_balance

  erb :user_dashboard
end
