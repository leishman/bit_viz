class Transaction < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :coinbase_id, :message => "Tx already exists in database"

  def total_sell_price

  end

  def total_avg_price

  end

  def avg_sell_price

  end

  def avg_purchase_price

  end

end
