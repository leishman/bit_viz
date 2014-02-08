helpers do

  def get_access_token
    code = params["code"]
    response = HTTParty.post("https://coinbase.com/oauth/token?grant_type=authorization_code&code=#{code}&redirect_uri=#{ENV['CALLBACK_URL']}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}")
    JSON.parse(response.body)["access_token"]
  end

  def get_transactions
    response = HTTParty.get("https://coinbase.com/api/v1/transactions?access_token=#{@token}")
    JSON.parse(response.body)
  end

  def get_transfers
    response = HTTParty.get("https://coinbase.com/api/v1/transfers?access_token=#{@token}")
    JSON.parse(response.body)['transfers']
  end

  def get_balance
    response = HTTParty.get("https://coinbase.com/api/v1/account/balance?access_token=#{@token}")
    JSON.parse(response.body)['amount'] # assuming unit is BTC
  end
end