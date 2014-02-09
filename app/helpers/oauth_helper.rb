helpers do

  def get_access_token
    code = params["code"]
    resp = HTTParty.post("https://coinbase.com/oauth/token?grant_type=authorization_code&code=#{code}&redirect_uri=#{ENV['CALLBACK_URL']}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}")
    JSON.parse(resp.body)["access_token"]
  end

  def sign_in_user
    email = @resp['current_user']['email']
    p @resp['current_user']
    @user = User.find_by_email(email)

    if @user.nil?
      @user = User.create({email: email})
    end
    session[:user_id] = @user.id
    session[:user_email] = email
  end

  def get_transactions # return array of transactions
    @resp = HTTParty.get("https://coinbase.com/api/v1/transactions?access_token=#{@token}")
    @resp = JSON.parse(@resp.body)['transactions']
    # sign_in_user
    # sessions[:user]
    # flatten each transaction and stack in array
    @resp
  end

  def get_transfers # return array of transfers
    resp = HTTParty.get("https://coinbase.com/api/v1/transfers?access_token=#{@token}")
    JSON.parse(resp.body)['transfers']
    # flatten each transfer and stack in array
  end

  def get_balance # return integer
    resp = HTTParty.get("https://coinbase.com/api/v1/account/balance?access_token=#{@token}")
    JSON.parse(resp.body)['amount'] # assuming unit is BTC
    # return balance
  end

  def get_user_data
    @token = get_access_token
    @transactions = get_transactions
    @transfers = get_transfers
    @balance = get_balance
  end

  def update_user_data
    # Save all transactions that aren't already stored in database
    @transactions.each do |t|
      # check data before creating
      Transaction.create(t)
    end

    @transfers.each do |t|
      Transfer.create(t)
    end

  end
end