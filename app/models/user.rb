class User < ActiveRecord::Base
  has_many :transfers
  has_many :transactions
  validates_uniqueness_of :email, :message => "Email has already been used"

  def average_buy_price
    buy_orders = self.transfers.where(order_type: "Buy")
    total_btc = 0
    total_usd = 0
    buy_orders.each do |order|
      total_btc += order.btc_amount / 100_000_000
      total_usd += order.total_amount / 100
    end
    return (total_usd / total_btc).to_f.round(3)
  end
end
