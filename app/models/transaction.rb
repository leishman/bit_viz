class Transaction < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :User

  def total_sell_price

  end

  def total_avg_price

  end

  def avg_sell_price

  end

  def avg_purchase_price

  end

end
