require 'debugger'
require 'json'
require 'mathn'

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
  assign_user
  @average_buy_price = @user.average_buy_price
  p @average_buy_price
  erb :user_dashboard
end

get '/data' do
  content_type :json
  trans_values = Transaction.pluck(:amount)
  data = []
  trans_values.each do |value|
    data << {value: value}
  end
  data.to_json
end
