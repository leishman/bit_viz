helpers do

  def get_access_token
    code = params["code"]
    response = HTTParty.post("https://coinbase.com/oauth/token?grant_type=authorization_code&code=#{code}&redirect_uri=#{ENV['CALLBACK_URL']}&client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}")
    JSON.parse(response.body)["access_token"]
  end

  def sign_in_user
    email = @response['current_user']['email']
    @user = User.find_by_email(email)

    if @user.nil?
      @user = User.create({email: email})
    end
    sessions[:user_id] = @user.id
  end

  def get_transactions # return array of transactions
    @response = HTTParty.get("https://coinbase.com/api/v1/transactions?access_token=#{@token}")
    @response = JSON.parse(response.body)
    sign_in_user
    # sessions[:user]
    # flatten each transaction and stack in array
    @response
  end

  def get_transfers # return array of transfers
    response = HTTParty.get("https://coinbase.com/api/v1/transfers?access_token=#{@token}")
    JSON.parse(response.body)['transfers']
    # flatten each transfer and stack in array
  end

  def get_balance # return integer
    response = HTTParty.get("https://coinbase.com/api/v1/account/balance?access_token=#{@token}")
    JSON.parse(response.body)['amount'] # assuming unit is BTC
    # return balance
  end

  def get_user_data
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