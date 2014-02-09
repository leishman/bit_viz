class User < ActiveRecord::Base
  has_many :transfers
  has_many :transactions
  validates_uniqueness_of :email, :message => "Email has already been used"
end
