class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :transfers
  has_many :transactions


end
