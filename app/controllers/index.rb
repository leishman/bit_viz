require 'debugger'

get '/' do
  @coinbase_url="https://coinbase.com/oauth/authorize?response_type=code&client_id=#{ENV['CLIENT_ID']}&redirect_uri=#{ENV['CALLBACK_URL']}&scope=transactions+transfers+balance"
  erb :index
end

get '/oauth-callback' do
  get_user_data
  update_user_data # method to update database with new transaction and transfers for user
  # redirect '/dashboard'
  erb :user_dashboard
end

get '/dashboard' do

  erb :user_dashboard
end
