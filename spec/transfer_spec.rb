require_relative 'spec_helper'

describe Transfer do
	it { should validate_uniqueness_of(:coinbase_id).
		with_message('Tf already exists in database') }
	it { should belong_to(:user) }
end