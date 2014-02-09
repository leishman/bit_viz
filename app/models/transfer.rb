class Transfer < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :coinbase_id, :message => "Tf already exists in database"
end
