class Transfer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :User
end
