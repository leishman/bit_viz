class Transaction < ActiveRecord::Base
  belongs_to :user

  def total_sell_price

  end

  def total_avg_price

  end

  def avg_sell_price

  end

  def avg_purchase_price

  end

end
